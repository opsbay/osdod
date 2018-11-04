//
//  OSDOD.swift
//  osdod
//
//  Created by Vlad Yarotsky on 10/5/18.
//  Copyright © 2018 Vlad Yarotsky. All rights reserved.
//

import Foundation

class OSDOD: NSObject, OSDODProtocol {
    let osdController: OSDController
    
    init(osdController: OSDController) {
        self.osdController = osdController
    }
    
    func showOSD() {
        NSLog("Showing OSD")
        DispatchQueue.main.sync {
            osdController.showOSD()
        }
    }
    
    func hideOSD() {
        NSLog("Hiding OSD")
        DispatchQueue.main.sync {
            osdController.hideOSD()
        }
    }
}
