//
//  NoInsetHostingView.swift
//  RingMate
//
//  Created by Anshumali Karna on 02/03/23.
//

import SwiftUI

class NoInsetHostingView<V>: NSHostingView<V> where V: View {
    
    override var safeAreaInsets: NSEdgeInsets {
        return .init()
    }
    
}
