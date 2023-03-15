//
//  RecentChats.swift
//  WhatsApp Messenger
//
//  Created by Anshumali Karna on 28/12/22.
//

import SwiftUI

struct RecentChats : Identifiable {
    var id = UUID().uuidString
    var lastMessage : String
    var lastMessageTime : String
    var pendingMessages : String
    var userName : String
    var userImage : String
    var userPhone : String
    var allMessage : [Message]
}


var chats : [RecentChats] = [
    RecentChats(lastMessage: "Hello", lastMessageTime: "23:50", pendingMessages: "69", userName: "Ben Dover", userImage: "bendover", userPhone: "+917777733", allMessage: BenDOVER_CHATS.shuffled()),
    RecentChats(lastMessage: "Hello", lastMessageTime: "23:50", pendingMessages: "69", userName: "Ben Dover", userImage: "bendover", userPhone: "+917777733", allMessage: BenDOVER_CHATS.shuffled()),
    RecentChats(lastMessage: "Hello", lastMessageTime: "23:50", pendingMessages: "69", userName: "Ben Dover", userImage: "bendover", userPhone: "+917777733", allMessage: BenDOVER_CHATS.shuffled()),
    RecentChats(lastMessage: "Hello", lastMessageTime: "23:50", pendingMessages: "69", userName: "Ben Dover", userImage: "bendover", userPhone: "+917777733", allMessage: BenDOVER_CHATS.shuffled()),
    RecentChats(lastMessage: "Hello", lastMessageTime: "23:50", pendingMessages: "69", userName: "Ben Dover", userImage: "bendover", userPhone: "+917777733", allMessage: BenDOVER_CHATS.shuffled()),
    RecentChats(lastMessage: "Hello", lastMessageTime: "23:50", pendingMessages: "69", userName: "Ben Dover", userImage: "bendover", userPhone: "+917777733", allMessage: BenDOVER_CHATS.shuffled()),
]
