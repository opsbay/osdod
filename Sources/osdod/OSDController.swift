//
//  OSDController.swift
//  osdod
//
//  Created by Vlad Yarotsky on 10/5/18.
//  Copyright © 2018 Vlad Yarotsky. All rights reserved.
//

import Foundation
import AppKit

final class OSDController: NSObject, NSApplicationDelegate {
    let window1 = NSWindow(contentRect: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.maxX, height: NSScreen.main!.frame.maxY), styleMask: [.closable], backing: .buffered, defer: false)
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let view1 = OSDView(frame: window1.frame)
        window1.contentView = view1
        window1.isOpaque = false
        window1.hasShadow = false
        window1.backgroundColor = NSColor(calibratedHue: 0, saturation: 1.0, brightness: 0, alpha: 0.5)
        window1.level = .screenSaver
    }
    
    func applicationWillTerminate(_ notification: Notification) {
    }
    
    func showOSD() {
        window1.makeKeyAndOrderFront(self)
        NSApp.activate(ignoringOtherApps: true)
    }
    
    func hideOSD() {
        window1.orderOut(self)
    }
}
