//
//  main.swift
//  osdod
//
//  Created by Vlad Yarotsky on 10/5/18.
//  Copyright © 2018 Vlad Yarotsky. All rights reserved.
//

import Foundation
import AppKit

let args = ProcessInfo.processInfo.arguments

if args.count > 1 && args[1] == "demo" {
    print("demo time!")
    
    class TestView: NSView {
        override init(frame: NSRect) {
            super.init(frame: frame)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func draw(_ dirtyRect: NSRect) {
            let h = dirtyRect.height
            let w = dirtyRect.width
            let color: NSColor = NSColor.yellow
            
            let drect = NSRect(x: (w * 0.25), y: (h * 0.25), width: (w * 0.5), height: (h * 0.5))
            let bpath: NSBezierPath = NSBezierPath(rect: drect)
            
            color.set()
            bpath.stroke()
            
            NSLog("drawRect has updated the view")
        }
    }
    
    final class TestApplicationController: NSObject, NSApplicationDelegate
    {
        let window1 = NSWindow(contentRect: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.maxX, height: NSScreen.main!.frame.maxY), styleMask: [.closable], backing: .buffered, defer: false)
        
        func applicationDidFinishLaunching(_ notification: Notification) {
            let view1 = TestView(frame: window1.frame)
            window1.contentView = view1
            window1.isOpaque = false
            window1.hasShadow = false
            window1.backgroundColor = NSColor(calibratedHue: 0, saturation: 1.0, brightness: 0, alpha: 0.5)
            window1.makeKeyAndOrderFront(self)
        }
        
        func applicationWillTerminate(_ notification: Notification) {
            
        }
    }
    
    let app1 = NSApplication.shared
    let con1 = TestApplicationController()
    
    app1.delegate = con1
    app1.run()
} else {
    let delegate = OSDODDelegate()
    let listener = NSXPCListener.init(machServiceName: "me.yarotsky.osdod")
    listener.delegate = delegate
    listener.resume()
    print("accepting requests")
    RunLoop.current.run()
}

