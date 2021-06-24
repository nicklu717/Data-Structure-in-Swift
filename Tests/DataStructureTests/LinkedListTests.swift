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
    
    // MARK: - Tests: Initialize
    func testInit() {
        linkedList = LinkedList()
        
        XCTAssert(linkedList.count == 0)
        XCTAssert(linkedList.isEmpty)
    }
    
    func testInitWithArray() {
        linkedList = LinkedList(values: [0, 1, 2])
        
        XCTAssert(linkedList.count == 3)
        XCTAssert(!linkedList.isEmpty)
    }
    
    // MARK: - Tests: Push
    func testPushOneValue() {
        linkedList = LinkedList()
        linkedList.push(0)
        
        XCTAssert(linkedList[0] == 0)
        XCTAssert(linkedList.count == 1)
    }
    
    func testPushMultipleValues() {
        linkedList = LinkedList()
        linkedList.push(2)
        linkedList.push(1)
        linkedList.push(0)
        
        XCTAssert(linkedList[0] == 0)
        XCTAssert(linkedList[1] == 1)
        XCTAssert(linkedList[2] == 2)
        XCTAssert(linkedList.count == 3)
    }
    
    // MARK: - Tests: Append
    func testAppendOneValue() {
        linkedList = LinkedList()
        linkedList.append(0)
        
        XCTAssert(linkedList[0] == 0)
        XCTAssert(linkedList.count == 1)
    }
    
    func testAppendMultipleValues() {
        linkedList = LinkedList()
        linkedList.append(0)
        linkedList.append(1)
        linkedList.append(2)
        
        XCTAssert(linkedList[0] == 0)
        XCTAssert(linkedList[1] == 1)
        XCTAssert(linkedList[2] == 2)
        XCTAssert(linkedList.count == 3)
    }
    
    // MARK: - Tests: Insert
    func testInsert() {
        linkedList = LinkedList(values: [0, 1, 2])
        XCTAssertNoThrow(try linkedList.insert(10, at: 2))
        
        XCTAssert(linkedList[0] == 0)
        XCTAssert(linkedList[1] == 1)
        XCTAssert(linkedList[2] == 10)
        XCTAssert(linkedList[3] == 2)
        XCTAssert(linkedList.count == 4)
    }
    
    func testInsertAtHead() {
        linkedList = LinkedList(values: [0, 1, 2])
        XCTAssertNoThrow(try linkedList.insert(-1, at: 0))
        
        XCTAssert(linkedList[0] == -1)
        XCTAssert(linkedList[1] == 0)
        XCTAssert(linkedList[2] == 1)
        XCTAssert(linkedList[3] == 2)
        XCTAssert(linkedList.count == 4)
    }
    
    func testInsertAtTail() {
        linkedList = LinkedList(values: [0, 1, 2])
        XCTAssertNoThrow(try linkedList.insert(3, at: 3))
        
        XCTAssert(linkedList[0] == 0)
        XCTAssert(linkedList[1] == 1)
        XCTAssert(linkedList[2] == 2)
        XCTAssert(linkedList[3] == 3)
        XCTAssert(linkedList.count == 4)
    }
    
    func testInsertWhenEmpty() {
        linkedList = LinkedList()
        XCTAssertNoThrow(try linkedList.insert(0, at: 0))
        
        XCTAssert(linkedList[0] == 0)
        XCTAssert(linkedList.count == 1)
    }
    
    func testInsertAtOutOfRangeIndex() {
        linkedList = LinkedList()
        var error: Error?
        
        XCTAssertThrowsError(try linkedList.insert(0, at: 1)) { error = $0 }
        XCTAssert((error as! LinkedList<Int>.Error) == .indexOutOfRange)
    }
    
    func testInsertAtInvalidIndex() {
        linkedList = LinkedList()
        var error: Error?
        
        XCTAssertThrowsError(try linkedList.insert(0, at: -1)) { error = $0 }
        XCTAssert((error as! LinkedList<Int>.Error) == .invalidIndex)
    }
    
    // MARK: - Tests: Description
    func testDescriptionWithNoNode() {
        linkedList = LinkedList()
        let output = String(describing: linkedList!)
        
        XCTAssert(output == "nil")
    }
    
    func testDescriptionWithNodes() {
        linkedList = LinkedList(values: [0, 1, 2])
        let output = String(describing: linkedList!)
        
        XCTAssert(output == "0 -> 1 -> 2")
    }
}
