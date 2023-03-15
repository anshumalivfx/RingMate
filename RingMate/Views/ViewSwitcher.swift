//
//  ViewSwitcher.swift
//  WhatsApp Messenger
//
//  Created by Anshumali Karna on 28/12/22.
//

import SwiftUI
import Foundation
import Combine

class ViewSwitcher : ObservableObject {
    @Published var currentView = "chatView"
}

