//
//  ChatsView.swift
//  WhatsApp Messenger
//
//  Created by Anshumali Karna on 28/12/22.
//

import SwiftUI

struct ChatsView: View {
    @EnvironmentObject var chatsData : ChatViewModel
    @State var showNewMessage: Bool = false
    @State var showAddFriends: Bool = false
    var body: some View {
        
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
                        .foregroundColor(.white)
                    
                }
                .buttonStyle(.plain)
                Button {
                    showNewMessage = true
                } label: {
                    Image(systemName: "square.and.pencil")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                }
                .buttonStyle(.plain)

            }
            .padding()
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search....", text: $chatsData.search)
                    .textFieldStyle(.plain)
            }
            .padding(.vertical,9)
            .padding(.horizontal)
            .background(Color.primary.opacity(0.15))
            .cornerRadius(10)
            .padding()
            List(selection: $chatsData.selectedRecentMessage)
            {
                ForEach(chatsData.msg) { message in
                    NavigationLink {
                        Conversation(user: message)
                    }
                    
                label: {
                        ChatCards(recentMessage: message)
                    }
                }
            }
            .listStyle(.sidebar)
            
        }
        .sheet(isPresented: $showAddFriends, content: {
            AddFriendView()
        })
        .sheet(isPresented: $showNewMessage) {
            NewMessageView()
        }
        
        }
        
}
