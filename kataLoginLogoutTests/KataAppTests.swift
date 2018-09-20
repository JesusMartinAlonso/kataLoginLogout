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
    
    var clockMock : ClockMock!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        kataApp = KataApp()
        clockMock = ClockMock()
        kataApp.clock = clockMock
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
   
    func testLoginFails(){
        
        XCTAssertFalse(try! kataApp.login(username: "asd", password: "admin"))
        
    }
    
    func testLoginSuccess(){
        
        XCTAssertTrue(try! kataApp.login(username: "admin", password: "admin"))
        
    }
    
    
    func test_login_username_invalid_character_is_point(){
        
        XCTAssertThrowsError(try kataApp.login(username: "admin.", password: "asd"))
        
    
    }
    
    func test_login_username_invalid_character_is_comma(){
        
        XCTAssertThrowsError(try kataApp.login(username: "admin,", password: "asd")){
            error in
            
            guard let _ = error as? LoginError else {
                XCTFail()
                return
            }
            
            
        }
        
        
    }
    
    func test_login_username_invalid_character_is_semicolon(){
        
        XCTAssertThrowsError(try kataApp.login(username: "admin;", password: "asd"))
        
        
    }
    
    
    
    func test_logout_current_second_is_pair(){
        givenNowIs(Date(timeIntervalSince1970: 2))
        
        XCTAssertTrue(kataApp.logout())
        
    }
    
    func test_logout_current_second_is_odd(){
         givenNowIs(Date(timeIntervalSince1970: 1))
        
         XCTAssertFalse(kataApp.logout())
    }
    
    
    private func givenNowIs(_ date: Date){
        clockMock.mockedNow = date
    }
}

class ClockMock : Clock {
    
    var mockedNow : Date = Date()
    
    override var now: Date {
        return mockedNow
    }
    
}



