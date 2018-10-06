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
    NSLog("demo time!")
    
    let app1 = NSApplication.shared
    let con1 = OSDController()
    
    app1.delegate = con1
    con1.showOSD()
    app1.run()
} else {
    let app1 = NSApplication.shared
    let con1 = OSDController()
    
    app1.delegate = con1
    
    let osdod = OSDOD(osdController: con1)
    let delegate = OSDODDelegate(osdod: osdod)
    let listener = NSXPCListener.init(machServiceName: "me.yarotsky.osdod")
    listener.delegate = delegate
    listener.resume()
    NSLog("accepting requests")
    
    app1.run()
}

