//
//  OSDODDelegate.swift
//  osdod
//
//  Created by Vlad Yarotsky on 10/5/18.
//  Copyright © 2018 Vlad Yarotsky. All rights reserved.
//

import Foundation
import AppKit

class OSDODDelegate: NSObject, NSXPCListenerDelegate {
    let osdod: OSDOD
    
    init(osdod: OSDOD) {
        self.osdod = osdod
    }
    
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        let exportedObject = osdod
        newConnection.exportedInterface = NSXPCInterface(with: OSDODProtocol.self)
        newConnection.exportedObject = exportedObject
        newConnection.resume()
        return true
    }
}
