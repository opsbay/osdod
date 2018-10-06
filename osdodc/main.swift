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

let service = connection.synchronousRemoteObjectProxyWithErrorHandler() { error in print("Received error:", error) } as? OSDODProtocol

service?.upperCaseString("hello XPC", withReply: { (response) in
    
    print("Response from XPC Service:", response)
})
