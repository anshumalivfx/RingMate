//
//  Extensions.swift
//  RingMate
//
//  Created by Anshumali Karna on 02/03/23.
//
import SwiftUI
import Cocoa

extension View {
    
    func renderAsImage() -> NSImage? {
        let view = NoInsetHostingView(rootView: self)
        view.setFrameSize(view.fittingSize)
        return view.bitmapImage()
    }

}
