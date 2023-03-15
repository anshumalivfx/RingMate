//
//  ChatViewModel.swift
//  WhatsApp Messenger
//
//  Created by Anshumali Karna on 28/12/22.
//

import Foundation

class ChatViewModel : ObservableObject {
    @Published var selectedTab = "Chats"
    
    @Published var msg : [RecentChats] = chats
    
    @Published var selectedRecentMessage : String? = chats.first?.id
    
    @Published var search = ""
    
    @Published var message = ""
    
    @Published var pickedSelection = ""
}
