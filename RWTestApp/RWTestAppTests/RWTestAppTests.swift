//
//  RWTestAppTests.swift
//  RWTestAppTests
//
//  Created by Rodolfo Benjamin Alcantara Solorio on 28/10/19.
//  Copyright © 2019 Rodolfo Benjamin Alcantara Solorio. All rights reserved.
//

import XCTest
@testable import RWTestApp
@testable import RWSecurity
import RWSecurity

class RWTestAppTests: XCTestCase {
    var nombre: Data? = Data()
    
    override func setUp() {
        self.nombre = "Sofia".data(using: .utf8)
    }

    override func tearDown() {
        
    }

    func testKeychainSavingData() {
        do {
            try KeychainWrapper.set(value: nombre!, account: "Nombre")
            let nombreDataRecuperado = try KeychainWrapper.get(account: "Nombre")
            XCTAssertNotNil(nombreDataRecuperado)
            guard let nombreRecuperado = nombreDataRecuperado else {
                XCTFail()
                return
            }
            XCTAssert(String(data: nombreRecuperado, encoding: .utf8) == "Sofia")
        } catch {
            XCTFail()
        }
    }
    
    func testKeychainDeleteAll() {
        do {
            try KeychainWrapper.set(value: nombre!, account: "Nombre")
            try KeychainWrapper.deleteAll()
            let _ = try KeychainWrapper.get(account: "Nombre")
            XCTFail() // Condición fallida
        } catch {
            XCTAssert(true) // Condición exitosa
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            testKeychainSavingData()
        }
    }

}
