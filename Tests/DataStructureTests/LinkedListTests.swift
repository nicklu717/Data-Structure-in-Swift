//
//  LinkedListTests.swift
//  DataStructureTests
//
//  Created by 陸瑋恩 on 2021/6/21.
//

import XCTest
@testable import DataStructure

final class LinkedListTestCase: XCTestCase {
    
    // MARK: - Properties
    private var linkedList: LinkedList<Int>!
    
    // MARK: - Life Cycle
    
    override func tearDown() {
        linkedList = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testInitWithNoHead() {
        linkedList = LinkedList()
        XCTAssert(linkedList.head == nil)
        XCTAssert(linkedList.tail == nil)
    }
    
    func testInitWithHead() {
        let headNode = Node<Int>(value: 10)
        
        linkedList = LinkedList(head: headNode)
        XCTAssert(linkedList.head === headNode)
        XCTAssert(linkedList.tail === headNode)
    }
    
    func testInitWithValue() {
        linkedList = LinkedList(headValue: 20)
        XCTAssert(linkedList.head?.value == 20)
        XCTAssert(linkedList.tail?.value == 20)
    }
}
