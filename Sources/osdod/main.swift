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
    
    let app = NSApplication.shared
    let con = OSDController()
    
    app.delegate = con
    con.showOSD()
    app.run()
} else {
    let app = NSApplication.shared
    let con = OSDController()
    
    app.delegate = con
    
    let osdod = OSDOD(osdController: con)
    let delegate = OSDODDelegate(osdod: osdod)
    let listener = NSXPCListener.init(machServiceName: "me.yarotsky.osdod")
    listener.delegate = delegate
    listener.resume()
    NSLog("accepting requests")
    
    app.run()
}

