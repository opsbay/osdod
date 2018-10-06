//
//  OSDODDelegate.swift
//  osdod
//
//  Created by Vlad Yarotsky on 10/5/18.
//  Copyright © 2018 Vlad Yarotsky. All rights reserved.
//

import Foundation

class OSDODDelegate: NSObject, NSXPCListenerDelegate {
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        let exportedObject = OSDOD()
        newConnection.exportedInterface = NSXPCInterface(with: OSDODProtocol.self)
        newConnection.exportedObject = exportedObject
        newConnection.resume()
        return true
    }
}
