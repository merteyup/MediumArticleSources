//
//  UnitTestWithSwiftTests.swift
//  UnitTestWithSwiftTests
//
//  Created by Eyüp Mert on 5.09.2023.
//

import XCTest
@testable import UnitTestWithSwift

final class UnitTestWithSwiftTests: XCTestCase {
    
    func test_assertionIsTrue() {
        // Given (Verilen)
        var justANumber = 1
        
        // When (Eylem)
        justANumber += 1
        
        // Then (Beklenen)
        XCTAssertTrue(justANumber == 2)
    }
    
    func test_assertionIsFalse() {
        // Given (Verilen)
        var justANumber = 1
        
        // When (Eylem)
        justANumber += 5
        
        // Then (Beklenen)
        XCTAssertFalse(justANumber == 2)
    }
    
    func test_assertionIsNil() {
        // Given (Verilen)
        var justANumber : Int? = 1
        
        // When (Eylem)
        justANumber = nil
        
        // Then (Beklenen)
        XCTAssertNil(justANumber)
    }
    
    func test_assertionIsNotNil() {
        // Given (Verilen)
        var justANumber : Int?
        
        // When (Eylem)
        justANumber = 1
        
        // Then (Beklenen)
        XCTAssertNotNil(justANumber)
    }
    
    func test_assertionIsEqual() {
        // Given (Verilen)
        var justANumber = 1
        
        // When (Eylem)
        justANumber += 1
        
        // Then (Beklenen)
        XCTAssertEqual(justANumber, 2)
    }
    
    /*
    func test_assertionIsEqualWithDescription() {
        // Given (Verilen)
        var justANumber = 1
        
        // When (Eylem)
        justANumber += 1
        
        // Then (Beklenen)
        XCTAssertEqual(justANumber, 5, "Expected 5, found \(justANumber)")
    }
     */
}
