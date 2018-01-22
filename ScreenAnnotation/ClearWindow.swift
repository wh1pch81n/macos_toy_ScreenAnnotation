//
//  ClearWindow.swift
//  ScreenAnnotation
//
//  Created by Derrick Ho on 1/22/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

import Cocoa

class ClearWindow: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: StyleMask.borderless, backing: backingStoreType, defer: flag)
        
        level = NSWindow.Level.statusBar // sets the level of the window to the status bar level
        backgroundColor = NSColor.blue.withAlphaComponent(0.7)
    }
    
    override func mouseDown(with event: NSEvent) {
        print("Mouse down: \(event.locationInWindow)")
    }
    
    override func mouseDragged(with event: NSEvent) {
        print("Mouse dragged: \(event.locationInWindow)")
        
    }
    
    override func mouseUp(with event: NSEvent) {
        print("Mouse up: \(event.locationInWindow)")
    }
    
}
