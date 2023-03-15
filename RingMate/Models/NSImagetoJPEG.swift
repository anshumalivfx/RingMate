//
//  NSImagetoJPEG.swift
//  RingMate
//
//  Created by Anshumali Karna on 02/03/23.
//

import Foundation
import Cocoa


func jpegDataFrom(image:NSImage) -> Data {
        let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil)!
        let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
        let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [:])!
        return jpegData
}
