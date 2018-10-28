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
    var windows: [NSWindow]
    var showing = false
    
    override init() {
        windows = []
        super.init()
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        updateWindows()
    }
    
    func applicationWillTerminate(_ notification: Notification) {
    }
    
    func showOSD() {
        if (showing) {
            return
        }
        NSLog("showOSD")
        showing = true
        
        for (idx, window) in windows.enumerated() {
            NSLog("show osd %d", idx)
            window.makeKeyAndOrderFront(self)
        }
        NSApp.activate(ignoringOtherApps: true)
    }
    
    func hideOSD() {
        if (!showing) {
            return
        }
        NSLog("hideOSD")
        showing = false
        for window in windows {
            window.orderOut(self)
        }
    }
    
    func updateWindows() {
        NSLog("updateWindows")
        let wasShowing = showing
        hideOSD()
        windows.removeAll()
        for screen in NSScreen.screens {
            let window = NSWindow(contentRect: screen.frame, styleMask: [.borderless], backing: .buffered, defer: false)
            
            let view = OSDView(frame: window.frame)
            window.contentView = view
            window.isOpaque = false
            window.hasShadow = false
            window.backgroundColor = NSColor(calibratedHue: 0, saturation: 1.0, brightness: 0, alpha: 0.5)
            window.level = .screenSaver
            
            windows.append(window)
        }
        if (wasShowing) {
            showOSD()
        }
    }
    
    func applicationDidChangeScreenParameters(_ notification: Notification) {
        NSLog("screen conf changed")
        updateWindows()
    }
}
