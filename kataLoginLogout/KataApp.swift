//
//  KataApp.swift
//  kataLoginLogout
//
//  Created by Jesus Martin Alonso on 20/9/18.
//  Copyright © 2018 Aiwin. All rights reserved.
//

import Foundation

class KataApp {
    
    func login(username : String, password : String) -> Bool {
        
        if username == "admin", password == "admin" {
            
            return true
        }
        
        return false
        
        
    }
    
    
}
