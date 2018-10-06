//
//  OSDODProtocol.swift
//  osdod
//
//  Created by Vlad Yarotsky on 10/5/18.
//  Copyright © 2018 Vlad Yarotsky. All rights reserved.
//

import Foundation

@objc public protocol OSDODProtocol {
    func upperCaseString(_ string: String, withReply reply: @escaping (String) -> Void)
}
