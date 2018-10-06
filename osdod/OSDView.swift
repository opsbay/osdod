//
//  OSDView.swift
//  osdod
//
//  Created by Vlad Yarotsky on 10/5/18.
//  Copyright © 2018 Vlad Yarotsky. All rights reserved.
//

import Foundation
import AppKit

class OSDView: NSView {
    let textField: NSTextField
    
    override init(frame: NSRect) {
        textField = NSTextField(labelWithString: "Window Management Mode")
        textField.font = NSFont(name: "Helvetica Neue", size: 24)
        super.init(frame: frame)
        addSubview(textField)
        textField.textColor = NSColor.white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setFrameOrigin(NSPoint(x: (bounds.width - textField.bounds.width) / 2, y: (bounds.height - textField.bounds.height) / 2))
        textField.autoresizingMask = [.minXMargin, .maxXMargin, .minYMargin, .maxYMargin]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        NSLog("drawRect has updated the view")
    }
}
