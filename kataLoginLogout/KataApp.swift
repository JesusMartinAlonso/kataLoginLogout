//
//  KataApp.swift
//  kataLoginLogout
//
//  Created by Jesus Martin Alonso on 20/9/18.
//  Copyright © 2018 Aiwin. All rights reserved.
//

import Foundation

enum LoginError : Error {
    
    case usernameWithInvalidCharacters
    
}



class KataApp {
    
    var clock : Clock
    
    init(clock : Clock) {
        self.clock = clock
    }
    
    init(){
        self.clock = Clock()
    }
    

    
    func login(username : String, password : String) throws -> Bool {
        
        let invalidLetters : CharacterSet = [",", ".", ";"]
        
        let range = username.rangeOfCharacter(from: invalidLetters )
        
        if range != nil {
            throw LoginError.usernameWithInvalidCharacters
        }
        
        if username == "admin", password == "admin" {
            
            return true
        }
        
        return false
        
        
    }
    
    
    func logout() -> Bool{
        
        return Int(clock.now.timeIntervalSince1970) % 2 == 0

    }
    
}



