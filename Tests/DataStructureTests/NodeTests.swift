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
    
    // MARK: - Tests: Initialize
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
    
    // MARK: - Tests: Description
    func testDescriptionWithNoNext() {
        node = Node(value: 0)
        let output = String(describing: node!)
        
        XCTAssert(output == "0")
    }
    
    func testDescriptionWithNexts() {
        let node1 = Node<Int>(value: 1)
        let node2 = Node<Int>(value: 2)
        node1.next = node2
        node = Node(value: 0, next: node1)
        let output = String(describing: node!)
        
        XCTAssert(output == "0 -> 1 -> 2")
    }
}
