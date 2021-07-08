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
    
    // MARK: - Tests: Get value
    func testGetValue() {
        linkedList = LinkedList(values: [0, 1, 2])
        
        XCTAssert(linkedList.value(at: -1) == nil)
        XCTAssert(linkedList.value(at: 0) == 0)
        XCTAssert(linkedList.value(at: 1) == 1)
        XCTAssert(linkedList.value(at: 2) == 2)
        XCTAssert(linkedList.value(at: 3) == nil)
    }
    
    func testGetValueWhenEmpty() {
        linkedList = LinkedList()
        
        XCTAssert(linkedList.value(at: -1) == nil)
        XCTAssert(linkedList.value(at: 0) == nil)
    }
    
    // MARK: - Tests: Push
    func testPushOneValue() {
        linkedList = LinkedList()
        linkedList.push(0)
        
        XCTAssert(linkedList.value(at: 0) == 0)
        XCTAssert(linkedList.value(at: 1) == nil)
        XCTAssert(linkedList.count == 1)
    }
    
    func testPushMultipleValues() {
        linkedList = LinkedList()
        linkedList.push(2)
        linkedList.push(1)
        linkedList.push(0)
        
        XCTAssert(linkedList.value(at: 0) == 0)
        XCTAssert(linkedList.value(at: 1) == 1)
        XCTAssert(linkedList.value(at: 2) == 2)
        XCTAssert(linkedList.value(at: 3) == nil)
        XCTAssert(linkedList.count == 3)
    }
    
    // MARK: - Tests: Append
    func testAppendOneValue() {
        linkedList = LinkedList()
        linkedList.append(0)
        
        XCTAssert(linkedList.value(at: 0) == 0)
        XCTAssert(linkedList.value(at: 1) == nil)
        XCTAssert(linkedList.count == 1)
    }
    
    func testAppendMultipleValues() {
        linkedList = LinkedList()
        linkedList.append(0)
        linkedList.append(1)
        linkedList.append(2)
        
        XCTAssert(linkedList.value(at: 0) == 0)
        XCTAssert(linkedList.value(at: 1) == 1)
        XCTAssert(linkedList.value(at: 2) == 2)
        XCTAssert(linkedList.value(at: 3) == nil)
        XCTAssert(linkedList.count == 3)
    }
    
    // MARK: - Tests: Insert
    func testInsert() {
        linkedList = LinkedList(values: [0, 1, 2])
        XCTAssertNoThrow(try linkedList.insert(10, at: 2))
        
        XCTAssert(linkedList.value(at: 0) == 0)
        XCTAssert(linkedList.value(at: 1) == 1)
        XCTAssert(linkedList.value(at: 2) == 10)
        XCTAssert(linkedList.value(at: 3) == 2)
        XCTAssert(linkedList.value(at: 4) == nil)
        XCTAssert(linkedList.count == 4)
    }
    
    func testInsertAtHead() {
        linkedList = LinkedList(values: [0, 1, 2])
        XCTAssertNoThrow(try linkedList.insert(-1, at: 0))
        
        XCTAssert(linkedList.value(at: 0) == -1)
        XCTAssert(linkedList.value(at: 1) == 0)
        XCTAssert(linkedList.value(at: 2) == 1)
        XCTAssert(linkedList.value(at: 3) == 2)
        XCTAssert(linkedList.value(at: 4) == nil)
        XCTAssert(linkedList.count == 4)
    }
    
    func testInsertAtTail() {
        linkedList = LinkedList(values: [0, 1, 2])
        XCTAssertNoThrow(try linkedList.insert(3, at: 3))
        
        XCTAssert(linkedList.value(at: 0) == 0)
        XCTAssert(linkedList.value(at: 1) == 1)
        XCTAssert(linkedList.value(at: 2) == 2)
        XCTAssert(linkedList.value(at: 3) == 3)
        XCTAssert(linkedList.value(at: 4) == nil)
        XCTAssert(linkedList.count == 4)
    }
    
    func testInsertWhenEmpty() {
        linkedList = LinkedList()
        XCTAssertNoThrow(try linkedList.insert(0, at: 0))
        
        XCTAssert(linkedList.value(at: 0) == 0)
        XCTAssert(linkedList.value(at: 1) == nil)
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
    
    // MARK: - Tests: Pop
    func testPop() {
        linkedList = LinkedList(values: [0, 1, 2])
        let poppedValue = linkedList.pop()
        
        XCTAssert(linkedList.value(at: 0) == 1)
        XCTAssert(linkedList.value(at: 1) == 2)
        XCTAssert(linkedList.value(at: 2) == nil)
        XCTAssert(linkedList.count == 2)
        XCTAssert(poppedValue == 0)
    }
    
    func testPopWhenEmpty() {
        linkedList = LinkedList()
        let poppedValue = linkedList.pop()
        
        XCTAssert(linkedList.value(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(poppedValue == nil)
    }
    
    func testPopForTheOnlyValue() {
        linkedList = LinkedList(values: [0])
        let poppedValue = linkedList.pop()
        
        XCTAssert(linkedList.value(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(poppedValue == 0)
    }
    
    // MARK: - Tests: PopLast
    func testPopLast() {
        linkedList = LinkedList(values: [0, 1, 2])
        let poppedValue = linkedList.popLast()
        
        XCTAssert(linkedList.value(at: 0) == 0)
        XCTAssert(linkedList.value(at: 1) == 1)
        XCTAssert(linkedList.value(at: 2) == nil)
        XCTAssert(linkedList.count == 2)
        XCTAssert(poppedValue == 2)
    }
    
    func testPopLastWhenEmpty() {
        linkedList = LinkedList()
        let poppedValue = linkedList.popLast()
        
        XCTAssert(linkedList.value(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(poppedValue == nil)
    }
    
    func testPopLastForTheOnlyValue() {
        linkedList = LinkedList(values: [0])
        let poppedValue = linkedList.popLast()
        
        XCTAssert(linkedList.value(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(poppedValue == 0)
    }
    
    // MARK: - Tests: Remove
    func testRemove() {
        linkedList = LinkedList(values: [0, 1, 2])
        let removedValue = linkedList.remove(at: 1)
        
        XCTAssert(linkedList.value(at: 0) == 0)
        XCTAssert(linkedList.value(at: 1) == 2)
        XCTAssert(linkedList.value(at: 2) == nil)
        XCTAssert(linkedList.count == 2)
        XCTAssert(removedValue == 1)
    }
    
    func testRemoveAtFirstIndex() {
        linkedList = LinkedList(values: [0, 1, 2])
        let removedValue = linkedList.remove(at: 0)
        
        XCTAssert(linkedList.value(at: 0) == 1)
        XCTAssert(linkedList.value(at: 1) == 2)
        XCTAssert(linkedList.value(at: 2) == nil)
        XCTAssert(linkedList.count == 2)
        XCTAssert(removedValue == 0)
    }
    
    func testRemoveAtLastIndex() {
        linkedList = LinkedList(values: [0, 1, 2])
        let removedValue = linkedList.remove(at: 2)
        
        XCTAssert(linkedList.value(at: 0) == 0)
        XCTAssert(linkedList.value(at: 1) == 1)
        XCTAssert(linkedList.value(at: 2) == nil)
        XCTAssert(linkedList.count == 2)
        XCTAssert(removedValue == 2)
    }
    
    func testRemoveForTheOnlyValue() {
        linkedList = LinkedList(values: [0])
        let removedValue = linkedList.remove(at: 0)
        
        XCTAssert(linkedList.value(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(removedValue == 0)
    }
    
    func testRemoveAtOutOfRangeIndex() {
        linkedList = LinkedList()
        let removedValue = linkedList.remove(at: 0)
        
        XCTAssert(linkedList.value(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(removedValue == nil)
    }
    
    func testRemoveAtInvalidIndex() {
        linkedList = LinkedList()
        let removedValue = linkedList.remove(at: -1)
        
        XCTAssert(linkedList.value(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(removedValue == nil)
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
