//
//  OSDOD.swift
//  osdod
//
//  Created by Vlad Yarotsky on 10/5/18.
//  Copyright © 2018 Vlad Yarotsky. All rights reserved.
//

import Foundation

class OSDOD: NSObject, OSDODProtocol {
    func upperCaseString(_ string: String, withReply reply: @escaping (String) -> Void) {
        print("received a call with:", string)
        let response = string.uppercased()
        reply(response)
    }
}
