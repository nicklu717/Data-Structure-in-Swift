//
//  NodeTests.swift
//  DataStructureTests
//
//  Created by 陸瑋恩 on 2021/6/21.
//

import XCTest
@testable import DataStructure

final class NodeTestCase: XCTestCase {
    
    // MARK: - Properties
    private var node: Node<Int>!
    
    // MARK: - Life Cycle
    override func tearDown() {
        node = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testInitWithNoNextNode() {
        node = Node(value: 100, next: nil)
        XCTAssert(node.value == 100)
        XCTAssert(node.next == nil)
    }
    
    func testInitWithNextNode() {
        let nextNode = Node(value: 5, next: nil)
        
        node = Node(value: 100, next: nextNode)
        XCTAssert(node.value == 100)
        XCTAssert(node.next === nextNode)
    }
}
