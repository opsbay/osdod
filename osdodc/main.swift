//
//  main.swift
//  osdodc
//
//  Created by Vlad Yarotsky on 10/5/18.
//  Copyright © 2018 Vlad Yarotsky. All rights reserved.
//

import Foundation

let connection = NSXPCConnection(machServiceName: "me.yarotsky.osdod", options: NSXPCConnection.Options(rawValue: 0))
connection.remoteObjectInterface = NSXPCInterface(with: OSDODProtocol.self)
connection.resume()

let service = connection.synchronousRemoteObjectProxyWithErrorHandler() { error in print("Received error:", error) } as! OSDODProtocol

let args = ProcessInfo.processInfo.arguments

func printUsage() {
    print("Usage:\n\t\(args[0]) show\n\t\(args[0]) hide")
}

if args.count < 2 {
    printUsage()
    exit(1)
}

if args[1] == "show" {
    service.showOSD()
} else if args[1] == "hide" {
    service.hideOSD()
} else {
    printUsage()
    exit(1)
}
