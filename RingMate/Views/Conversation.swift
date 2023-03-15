//
//  Conversation.swift
//  WhatsApp Messenger
//
//  Created by Anshumali Karna on 29/12/22.
//

import SwiftUI

struct Conversation: View {
    @EnvironmentObject var chatData : ChatViewModel
    var user : RecentChats
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(user.userName)
                        .font(.title2)
                    Spacer()
                    
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .buttonStyle(.plain)
                    
                    Image(systemName: "sidebar.right")
                        .font(.title2)
                        .buttonStyle(.plain)
                }
                .padding()
                
                Spacer()
                
                HStack(spacing: 30) {
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .font(.title2)
                        
                    }
                    .buttonStyle(.plain)
                    
                    TextField("Enter your message.....", text: $chatData.message)
                        .textFieldStyle(.plain)
                        .padding(.vertical, 7)
                        .padding(.horizontal)
                        .background(Capsule().strokeBorder(Color.white))
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "face.smiling.fill")
                            .font(.title2)
                        
                    }
                    .buttonStyle(.plain)
                    
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "mic")
                            .font(.title2)
                        
                    }
                    .buttonStyle(.plain)
                }
                .padding([.horizontal, .bottom])
            }
            
            ExpandView(user: user)
                .frame(width: 200)
                .background(BlurView())
            
            
            
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}


