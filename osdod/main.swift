//
//  main.swift
//  osdod
//
//  Created by Vlad Yarotsky on 10/5/18.
//  Copyright © 2018 Vlad Yarotsky. All rights reserved.
//

import Foundation

let delegate = OSDODDelegate()
let listener = NSXPCListener.init(machServiceName: "me.yarotsky.osdod")
listener.delegate = delegate
listener.resume()
print("accepting requests")
RunLoop.current.run()
