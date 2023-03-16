//
//  ChatViewModel.swift
//  WhatsApp Messenger
//
//  Created by Anshumali Karna on 28/12/22.
//

import Foundation

class ChatViewModel : ObservableObject {
    @Published var selectedTab = "Chats"
    
    @Published var messages: [RecentMessage] = recentMessages
    
    // Selected Recent Tab...
    @Published var selectedRecentMessage: String? = recentMessages.first?.id
    
    // Search ...
    @Published var search = ""
    
    // Message ...
    @Published var message = ""
    
    // Expanded Left Side View...
    @Published var isLeftExpanded = true
    
    // Expanded Right Side View...
    @Published var isRightExpanded = true
    
    // Picker Expanded Tab...
    @Published var pickedTab = "Media"
    
    // Send Message...
    func sendMessage(user: RecentMessage) {
      if message != "", let index = messages.firstIndex(where: { currentUser -> Bool in
        return currentUser.id == user.id
      }) {
        messages[index].allMessages.append(Message(message: message, myMessage: true))
        message = ""
      }
    }
}


import SwiftUI

// Recent Message Model....
struct RecentMessage : Identifiable {
  var id = UUID().uuidString
  var lastMessage : String
  var lastMessageTime : String
  var pendingMessages : String
  var userName : String
  var userImage : String
  var allMessages: [Message]
}

var recentMessages : [RecentMessage] = [
  RecentMessage( lastMessage: "Apple Tech", lastMessageTime: "15:00", pendingMessages: "9", userName: "Jenna Ezarik", userImage: "p0", allMessages: Eachmsg.shuffled()),
  RecentMessage(lastMessage: "New Album Is Going To Be Released!!!!", lastMessageTime: "14:32", pendingMessages: "2", userName: "Taylor", userImage: "p1", allMessages: Eachmsg.shuffled())
  ,RecentMessage( lastMessage: "Hi this is Steve Rogers !!!", lastMessageTime: "14:35", pendingMessages: "2", userName: "Steve", userImage: "p2", allMessages: Eachmsg.shuffled())
  ,RecentMessage( lastMessage: "New Tutorial !!!", lastMessageTime: "14:39", pendingMessages: "1", userName: "Sergei Meza", userImage: "p3", allMessages: Eachmsg.shuffled())
  ,RecentMessage(lastMessage: "New SwiftUI API Is Released!!!!", lastMessageTime: "14:50", pendingMessages: "", userName: "SwiftUI", userImage: "p4", allMessages: Eachmsg.shuffled()),
  RecentMessage( lastMessage: "Founder Of Microsoft !!!", lastMessageTime: "14:50", pendingMessages: "", userName: "Bill Gates", userImage: "p5", allMessages: Eachmsg.shuffled()),
  RecentMessage( lastMessage: "Founder Of Amazon", lastMessageTime: "14:39", pendingMessages: "1", userName: "Jeff", userImage: "p6", allMessages: Eachmsg.shuffled()),
  RecentMessage(lastMessage: "Released New iPhone 11!!!", lastMessageTime: "14:32", pendingMessages: "2", userName: "Tim Cook", userImage: "p7", allMessages: Eachmsg.shuffled())
]

// Message Model...


