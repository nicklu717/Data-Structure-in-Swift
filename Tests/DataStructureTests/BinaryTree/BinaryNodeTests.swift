//
//  BinaryNodeTests.swift
//  DataStructureTests
//
//  Created by 陸瑋恩 on 2023/2/14.
//

import XCTest
@testable import DataStructure

class BinaryNodeTests: XCTestCase {
    
    func testInitWithInt() {
        let number = 3
        let node = BinaryNode<Int>(element: number)
        XCTAssertEqual(node.element, number)
        
        XCTAssertNil(node.left)
        XCTAssertNil(node.right)
    }
    
    func testInitWithString() {
        let string = "Testing"
        let node = BinaryNode<String>(element: string)
        XCTAssertEqual(node.element, string)
    }
}
