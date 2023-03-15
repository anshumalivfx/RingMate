//
//  ChatCards.swift
//  WhatsApp Messenger
//
//  Created by Anshumali Karna on 28/12/22.
//

import SwiftUI


struct ChatCards: View {
    var recentMessage : RecentChats
    var body: some View {
        HStack {
            Image(recentMessage.userImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            VStack(spacing: 4) {
                HStack {
                    VStack(alignment: .leading, spacing: 4, content: {
                        Text(recentMessage.userName).fontWeight(.bold)
                        Text(recentMessage.lastMessage).font(.caption)
                    })
                    
                    Spacer(minLength: 10)
                    
                    VStack {
                        Text(recentMessage.lastMessageTime).font(.caption)
                        Text(recentMessage.pendingMessages).font(.caption2)
                            .padding(5)
                            .foregroundColor(Color.white)
                            .background(Color.blue, in: Circle())
                        
                    }
                }
            }
        }
    }
}
