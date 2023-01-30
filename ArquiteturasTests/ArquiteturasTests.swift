//
//  ArquiteturasTests.swift
//  ArquiteturasTests
//
//  Created by Frédéric Helfer on 27/01/23.
//

import XCTest
@testable import Arquiteturas

final class ArquiteturasTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testRegister() throws {
//        let manager = UserManager(business: UserBusiness())
//
//        manager.register(email: "aaaa", password: "a12345") { userModel in
//            print(userModel)
//        } failureHandler: { error in
//            print(error)
//        }
//
//        manager.register(email: "teste@teste.com", password: "aa") { userModel in
//            print(userModel)
//        } failureHandler: { error in
//            print(error)
//        }
//
//        manager.register(email: "teste@teste.com", password: "a12345") { userModel in
//            print(userModel)
//        } failureHandler: { error in
//            print(error)
//        }
//
//    }
//
//    func testLogin() throws {
//        let manager = UserManager(business: UserBusiness())
//
//        manager.login(email: "aaaa", password: "aaaa") { userModel in
//            print(userModel)
//        } failureHandler: { error in
//            print(error)
//        }
//
//        manager.login(email: "teste@teste.com", password: "a12345") { userModel in
//            print(userModel)
//        } failureHandler: { error in
//            print(error)
//        }
//
//    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
