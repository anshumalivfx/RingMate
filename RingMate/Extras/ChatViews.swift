//
//  ChatViews.swift
//  RingMate
//
//  Created by Anshumali Karna on 16/03/23.
//

// Views

import SwiftUI



struct Home: View {
  @StateObject var homeData = ChatViewModel()
  
  var body: some View {
    HStack(spacing: 0) {
      // App Tab Bar...
      AppTabBar()
      .padding()
      .padding(.top, 35)
      .background(BlurView())
      
      Divider()
      
      // Tab Content...
      TabContent()
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    .ignoresSafeArea(.all, edges: .all)
    .frame(width: screen.width / 1.1, height: screen.height - 60)
    // Inyecting state object as environment dependency to child views...
    .environmentObject(homeData)
  }
}

// App Tab Bar ...
struct AppTabBar: View {
  @EnvironmentObject var homeData: ChatViewModel
  
  var body: some View {
    VStack {
      TabButton(image: "message", title: "All Chats", selectedTab: $homeData.selectedTab)
      
      TabButton(image: "person", title: "Personal", selectedTab: $homeData.selectedTab)
      
      TabButton(image: "bubble.middle.bottom", title: "Bots", selectedTab: $homeData.selectedTab)
      
      TabButton(image: "slider.horizontal.3", title: "Edit", selectedTab: $homeData.selectedTab)
      
      Spacer()
      
      TabButton(image: "gear", title: "Settings", selectedTab: $homeData.selectedTab)
      
    }
  }
}

// Tab Content ....
struct TabContent: View {
  @EnvironmentObject var homeData: ChatViewModel
  
  var body: some View {
    ZStack {
      switch homeData.selectedTab {
      case "All Chats": NavigationView {
        AllChatsView()
      }
      case "Personal": Text("Personal")
      case "Bots": Text("Bots")
      case "Edit": Text("Edit")
      case "Settings": Text("Settings")
      default: Text("")
      }
    }
  }
}



struct AllChatsView: View {
  @Environment(\.colorScheme) var colorScheme
  
  @EnvironmentObject var homeData: ChatViewModel
  
  var body: some View {
    // Side Tab View...
    VStack {
      
      HStack {
        Spacer()
        
        Button(action: {}, label: {
          Image(systemName: "plus")
            .iconButton()
        })
        .buttonStyle(PlainButtonStyle())
      }
      .padding(.horizontal)
      
      
      HStack {
        Image(systemName: "magnifyingglass")
          .foregroundColor(.gray)
        
        TextField("Search", text: $homeData.search)
          .textFieldStyle(PlainTextFieldStyle())
      }
      .searchBar()
      .padding(10)
      
      List(selection: $homeData.selectedRecentMessage) {
      
        ForEach(homeData.messages) { message in
          
          // Message View...
          NavigationLink(
            destination: DetailView(user: message),
            label: {
              RecentMessageCardView(recentMessage: message)
            })
        }
      }
      .listStyle(SidebarListStyle())
    }
  }
}

struct RecentMessageCardView: View {
  var recentMessage: RecentMessage
  var body: some View {
    HStack {
      Image(recentMessage.userImage)
        .profileImage(size: 40)
      
      VStack(spacing: 4) {
        HStack {
          VStack(alignment: .leading, spacing: 4, content: {
            Text(recentMessage.userName)
              .fontWeight(.bold)
            
            Text(recentMessage.lastMessage)
              .font(.caption)
              .fontWeight(recentMessage.pendingMessages == "" ? .regular : .semibold)
          })
          
          Spacer(minLength: 10)
          
          VStack {
            Text(recentMessage.lastMessageTime)
              .font(.caption)
            
            Text(recentMessage.pendingMessages)
              .font(.caption2)
              .padding(5)
              .foregroundColor(.white)
              .background(Color.blue)
              .clipShape(Circle())
              .opacity(recentMessage.pendingMessages == "" ? 0 : 1)
          }
        }
      }
    }
  }
}

struct DetailView: View {
  @EnvironmentObject var homeData: ChatViewModel
  var user: RecentMessage
  
  var body: some View {
    HStack {
      VStack {
        HStack(spacing: 15) {
          Button(action: {
            homeData.isLeftExpanded.toggle()
            NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
          }, label: {
            Image(systemName: "sidebar.left")
              .font(.title2)
              .foregroundColor(homeData.isLeftExpanded ? .blue : .primary)
          })
          .buttonStyle(PlainButtonStyle())
          
          Text(user.userName)
            .font(.title2)
          
          Spacer()
          
          Button(action: {}, label: {
            Image(systemName: "magnifyingglass")
              .iconButton()
          })
          .buttonStyle(PlainButtonStyle())
          
          Button(action: {
            withAnimation {
              homeData.isRightExpanded.toggle()
            }
          }, label: {
            Image(systemName: "sidebar.right")
              .iconButton()
              .foregroundColor(homeData.isRightExpanded ? .blue : .primary)
          })
          .buttonStyle(PlainButtonStyle())
        }
        .padding()
        
        // Message View
        MessageView(user: user)
        
        HStack(spacing: 15) {
          Button(action: {}, label: {
            Image(systemName: "paperplane")
              .iconButton()
          })
          .buttonStyle(PlainButtonStyle())
          
          HStack {
            TextField(
              "Enter Message",
              text: $homeData.message,
              onCommit: {
              homeData.sendMessage(user: user)
                  homeData.message = ""
            })
              .textFieldStyle(PlainTextFieldStyle())
          }
          .inputBar()
          
          
          Button(action: {}, label: {
            Image(systemName: "face.smiling.fill")
              .iconButton()
          })
          .buttonStyle(PlainButtonStyle())
          
          Button(action: {}, label: {
            Image(systemName: "mic")
              .iconButton()
          })
          .buttonStyle(PlainButtonStyle())
        }
        .padding([.horizontal, .bottom])
      }
      .frame(minWidth: 700)
      
      ExpandedView(user: user)
        .background(BlurView())
        .frame(width: homeData.isRightExpanded ? nil : 0)
        .opacity(homeData.isRightExpanded ? 1 : 0)
    }
    .ignoresSafeArea(.all, edges: .all)
  }
}

// Message View...
struct MessageView: View {
  @EnvironmentObject var homeData: ChatViewModel
  var user: RecentMessage
  
  var body: some View {
    GeometryReader { reader in
      ScrollView {
        ScrollViewReader { proxy in
          VStack(spacing: 18) {
            ForEach(user.allMessages) { message in
              // Message Card View...
              MessageCardView(
                message: message,
                user: user,
                width: reader.frame(in: .global).width)
                .tag(message.id)
            }
            .onAppear(perform: {
              // Showing Last Message
              if let lastId = user.allMessages.last?.id {
                proxy.scrollTo(lastId, anchor: .bottom)
              }
            })
            .onChange(of: user.allMessages, perform: { value in
              // Same For WHen New Message Appended
              if let lastId = user.allMessages.last?.id {
                proxy.scrollTo(lastId, anchor: .bottom)
              }
            })
          }
          .padding(.bottom, 30)
        }
      }
    }
  }
}

// Message Card View...
struct MessageCardView: View {
  @EnvironmentObject var homeData: ChatViewModel
  var message: Message
  var user: RecentMessage
  var width: CGFloat
  
  var body: some View {
    HStack(spacing: 10) {
      
      if message.myMessage {
        Spacer()
        
        Text(message.message)
          .messageBubble(incoming: false)
          // MaxWidth...
          .frame(minWidth: 30, maxWidth: width / 2, alignment: .trailing)
      } else {
        Image(user.userImage)
          .profileImage(size: 35)
          .offset(y: 20)
        
        Text(message.message)
          .messageBubble(incoming: true)
          // MaxWidth...
          .frame(minWidth: 30, maxWidth: width / 2, alignment: .leading)
        
        Spacer()
      }
    }
    .padding(.horizontal)
  }
}

// Expanded View...
struct ExpandedView: View {
  
  @EnvironmentObject var homeData: ChatViewModel
  
  var user: RecentMessage
  
  var body: some View {
    HStack(spacing: 0) {
      Divider()
      
      VStack(spacing: 25) {
        Image(user.userImage)
          .profileImage(size: 90)
          .padding(.top, 35)
        
        Text(user.userName)
          .font(.title)
          .fontWeight(.bold)
        
        ProfileActionsSection()
        
        ProfileAttachmentsSection()
      }
      .padding(.horizontal)
      .frame(maxWidth: 300)
    }
  }
}

struct ProfileActionsSection: View {
  var body: some View {
    HStack {
      Button(action: {}, label: {
        
        VStack {
          Image(systemName: "bell.slash")
            .iconButton()
          
          Text("Mute")
        }
        .contentShape(Rectangle())
      })
      .buttonStyle(PlainButtonStyle())
      
      Spacer()
      
      Button(action: {}, label: {
        VStack {
          Image(systemName: "hand.raised.fill")
            .iconButton()
          
          Text("Block")
        }
        .contentShape(Rectangle())
      })
      .buttonStyle(PlainButtonStyle())
      
      Spacer()
      
      Button(action: {}, label: {
        VStack {
          Image(systemName: "exclamationmark.triangle")
            .iconButton()
          
          Text("Report")
        }
        .contentShape(Rectangle())
      })
      .buttonStyle(PlainButtonStyle())
    }
    .foregroundColor(.gray)
  }
}

struct ProfileAttachmentsSection: View {
  @EnvironmentObject var homeData: ChatViewModel
  
  var body: some View {
    Group {
      Picker(selection: $homeData.pickedTab, label: Text("Picker"), content: {
        Text("Media").tag("Media")
        Text("Links").tag("Links")
        Text("Audio").tag("Audio")
        Text("Files").tag("Files")
      })
      .pickerStyle(SegmentedPickerStyle())
      .labelsHidden()
      .padding(.vertical)
      
      ScrollView {
        if homeData.pickedTab == "Media" {
          
          // Grid of Photos...
          LazyVGrid(
            columns: Array(
              repeating: GridItem(
                .flexible(),
                spacing: 10),
              count: 3),
            spacing: 10,
            content: {
              
              ForEach(1...8, id: \.self) { index in
                
                Image("media\(index)")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  // Horizontal padding = 30
                  // Spacing = 30
                  // Width = (300 - 60)/3 = 80
                  .frame(width: 80, height: 80)
                  .cornerRadius(3)
              }
            })
        } else {
          Text("No \(homeData.pickedTab)")
        }
      }
    }
  }
}
