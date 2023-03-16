//
//  ChatsView.swift
//  WhatsApp Messenger
//
//  Created by Anshumali Karna on 28/12/22.
//

import SwiftUI

struct ChatsView: View {
    @State var showNewMessage: Bool = false
    @State var showAddFriends: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var homeData: ChatViewModel
    
    var body: some View {
      // Side Tab View...
      VStack {
        
          HStack {
              Text("Chats")
                  .font(.largeTitle)
                  .fontWeight(.heavy)
              Spacer()
              Button {
                  showAddFriends = true
              } label: {
                  Image(systemName: "person.fill.badge.plus")
                      .font(.title2)
                      .foregroundColor(.primary)
                  
              }
              .buttonStyle(.plain)
              Button {
                  showNewMessage = true
              } label: {
                  Image(systemName: "square.and.pencil")
                      .font(.title2)
                      .foregroundColor(.primary)
                  
              }
              .buttonStyle(.plain)

          }
          .padding()
        
        
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
      .sheet(isPresented: $showAddFriends) {
          AddFriendView()
      }
      .sheet(isPresented: $showNewMessage) {
          NewMessageView()
      }
    }
    
        
}
