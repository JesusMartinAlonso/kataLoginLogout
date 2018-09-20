//
//  KataAppTests.swift
//  kataLoginLogoutTests
//
//  Created by Jesus Martin Alonso on 20/9/18.
//  Copyright © 2018 Aiwin. All rights reserved.
//

import XCTest
@testable import kataLoginLogout


class KataAppTests: XCTestCase {
    
    var kataApp : KataApp!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        kataApp = KataApp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
   
    func testLoginFails(){
        
        XCTAssertFalse(kataApp.login(username: "asd", password: "admin"))
        
    }
    
    func testLoginSuccess(){
        
        XCTAssertTrue(kataApp.login(username: "admin", password: "admin"))
        
    }
    
    
    
}
