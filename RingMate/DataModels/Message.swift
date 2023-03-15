//
//  Message.swift
//  WhatsApp Messenger
//
//  Created by Anshumali Karna on 28/12/22.
//

import Foundation


struct Message : Identifiable, Equatable {
    var id = UUID().uuidString
    var message : String
    var myMessage : Bool
}

var BenDOVER_CHATS : [Message] = [
    Message(message: "Hello bhai", myMessage: true),
    Message(message: "TMKC", myMessage: false)
]
