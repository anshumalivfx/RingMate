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


