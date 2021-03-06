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
        linkedList = LinkedList(elements: [0, 1, 2])
        
        XCTAssert(linkedList.count == 3)
        XCTAssert(!linkedList.isEmpty)
    }
    
    // MARK: - Tests: Get element
    func testGetElement() {
        linkedList = LinkedList(elements: [0, 1, 2])
        
        XCTAssert(linkedList.element(at: -1) == nil)
        XCTAssert(linkedList.element(at: 0) == 0)
        XCTAssert(linkedList.element(at: 1) == 1)
        XCTAssert(linkedList.element(at: 2) == 2)
        XCTAssert(linkedList.element(at: 3) == nil)
    }
    
    func testGetElementWhenEmpty() {
        linkedList = LinkedList()
        
        XCTAssert(linkedList.element(at: -1) == nil)
        XCTAssert(linkedList.element(at: 0) == nil)
    }
    
    // MARK: - Tests: Push
    func testPushOneElement() {
        linkedList = LinkedList()
        linkedList.push(0)
        
        XCTAssert(linkedList.element(at: 0) == 0)
        XCTAssert(linkedList.element(at: 1) == nil)
        XCTAssert(linkedList.count == 1)
    }
    
    func testPushMultipleElements() {
        linkedList = LinkedList()
        linkedList.push(2)
        linkedList.push(1)
        linkedList.push(0)
        
        XCTAssert(linkedList.element(at: 0) == 0)
        XCTAssert(linkedList.element(at: 1) == 1)
        XCTAssert(linkedList.element(at: 2) == 2)
        XCTAssert(linkedList.element(at: 3) == nil)
        XCTAssert(linkedList.count == 3)
    }
    
    // MARK: - Tests: Append
    func testAppendOneElement() {
        linkedList = LinkedList()
        linkedList.append(0)
        
        XCTAssert(linkedList.element(at: 0) == 0)
        XCTAssert(linkedList.element(at: 1) == nil)
        XCTAssert(linkedList.count == 1)
    }
    
    func testAppendMultipleElements() {
        linkedList = LinkedList()
        linkedList.append(0)
        linkedList.append(1)
        linkedList.append(2)
        
        XCTAssert(linkedList.element(at: 0) == 0)
        XCTAssert(linkedList.element(at: 1) == 1)
        XCTAssert(linkedList.element(at: 2) == 2)
        XCTAssert(linkedList.element(at: 3) == nil)
        XCTAssert(linkedList.count == 3)
    }
    
    // MARK: - Tests: Insert
    func testInsert() {
        linkedList = LinkedList(elements: [0, 1, 2])
        XCTAssertNoThrow(try linkedList.insert(10, at: 2))
        
        XCTAssert(linkedList.element(at: 0) == 0)
        XCTAssert(linkedList.element(at: 1) == 1)
        XCTAssert(linkedList.element(at: 2) == 10)
        XCTAssert(linkedList.element(at: 3) == 2)
        XCTAssert(linkedList.element(at: 4) == nil)
        XCTAssert(linkedList.count == 4)
    }
    
    func testInsertAtHead() {
        linkedList = LinkedList(elements: [0, 1, 2])
        XCTAssertNoThrow(try linkedList.insert(-1, at: 0))
        
        XCTAssert(linkedList.element(at: 0) == -1)
        XCTAssert(linkedList.element(at: 1) == 0)
        XCTAssert(linkedList.element(at: 2) == 1)
        XCTAssert(linkedList.element(at: 3) == 2)
        XCTAssert(linkedList.element(at: 4) == nil)
        XCTAssert(linkedList.count == 4)
    }
    
    func testInsertAtTail() {
        linkedList = LinkedList(elements: [0, 1, 2])
        XCTAssertNoThrow(try linkedList.insert(3, at: 3))
        
        XCTAssert(linkedList.element(at: 0) == 0)
        XCTAssert(linkedList.element(at: 1) == 1)
        XCTAssert(linkedList.element(at: 2) == 2)
        XCTAssert(linkedList.element(at: 3) == 3)
        XCTAssert(linkedList.element(at: 4) == nil)
        XCTAssert(linkedList.count == 4)
    }
    
    func testInsertWhenEmpty() {
        linkedList = LinkedList()
        XCTAssertNoThrow(try linkedList.insert(0, at: 0))
        
        XCTAssert(linkedList.element(at: 0) == 0)
        XCTAssert(linkedList.element(at: 1) == nil)
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
        linkedList = LinkedList(elements: [0, 1, 2])
        let poppedElement = linkedList.pop()
        
        XCTAssert(linkedList.element(at: 0) == 1)
        XCTAssert(linkedList.element(at: 1) == 2)
        XCTAssert(linkedList.element(at: 2) == nil)
        XCTAssert(linkedList.count == 2)
        XCTAssert(poppedElement == 0)
    }
    
    func testPopWhenEmpty() {
        linkedList = LinkedList()
        let poppedElement = linkedList.pop()
        
        XCTAssert(linkedList.element(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(poppedElement == nil)
    }
    
    func testPopForTheOnlyElement() {
        linkedList = LinkedList(elements: [0])
        let poppedElement = linkedList.pop()
        
        XCTAssert(linkedList.element(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(poppedElement == 0)
    }
    
    // MARK: - Tests: PopLast
    func testPopLast() {
        linkedList = LinkedList(elements: [0, 1, 2])
        let poppedElement = linkedList.popLast()
        
        XCTAssert(linkedList.element(at: 0) == 0)
        XCTAssert(linkedList.element(at: 1) == 1)
        XCTAssert(linkedList.element(at: 2) == nil)
        XCTAssert(linkedList.count == 2)
        XCTAssert(poppedElement == 2)
    }
    
    func testPopLastWhenEmpty() {
        linkedList = LinkedList()
        let poppedElement = linkedList.popLast()
        
        XCTAssert(linkedList.element(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(poppedElement == nil)
    }
    
    func testPopLastForTheOnlyElement() {
        linkedList = LinkedList(elements: [0])
        let poppedElement = linkedList.popLast()
        
        XCTAssert(linkedList.element(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(poppedElement == 0)
    }
    
    // MARK: - Tests: Remove
    func testRemove() {
        linkedList = LinkedList(elements: [0, 1, 2])
        let removedElement = linkedList.remove(at: 1)
        
        XCTAssert(linkedList.element(at: 0) == 0)
        XCTAssert(linkedList.element(at: 1) == 2)
        XCTAssert(linkedList.element(at: 2) == nil)
        XCTAssert(linkedList.count == 2)
        XCTAssert(removedElement == 1)
    }
    
    func testRemoveAtFirstIndex() {
        linkedList = LinkedList(elements: [0, 1, 2])
        let removedElement = linkedList.remove(at: 0)
        
        XCTAssert(linkedList.element(at: 0) == 1)
        XCTAssert(linkedList.element(at: 1) == 2)
        XCTAssert(linkedList.element(at: 2) == nil)
        XCTAssert(linkedList.count == 2)
        XCTAssert(removedElement == 0)
    }
    
    func testRemoveAtLastIndex() {
        linkedList = LinkedList(elements: [0, 1, 2])
        let removedElement = linkedList.remove(at: 2)
        
        XCTAssert(linkedList.element(at: 0) == 0)
        XCTAssert(linkedList.element(at: 1) == 1)
        XCTAssert(linkedList.element(at: 2) == nil)
        XCTAssert(linkedList.count == 2)
        XCTAssert(removedElement == 2)
    }
    
    func testRemoveForTheOnlyElement() {
        linkedList = LinkedList(elements: [0])
        let removedElement = linkedList.remove(at: 0)
        
        XCTAssert(linkedList.element(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(removedElement == 0)
    }
    
    func testRemoveAtOutOfRangeIndex() {
        linkedList = LinkedList()
        let removedElement = linkedList.remove(at: 0)
        
        XCTAssert(linkedList.element(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(removedElement == nil)
    }
    
    func testRemoveAtInvalidIndex() {
        linkedList = LinkedList()
        let removedElement = linkedList.remove(at: -1)
        
        XCTAssert(linkedList.element(at: 0) == nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(removedElement == nil)
    }
    
    // MARK: - Tests: Collection
    func testIndexEquality() {
        linkedList = LinkedList(elements: [0, 1, 2])
        
        XCTAssert(linkedList.startIndex == linkedList.startIndex)
        XCTAssert(linkedList.endIndex == linkedList.endIndex)
        XCTAssert(linkedList.startIndex < linkedList.endIndex)
    }
    
    func testIndexEqualityWhenEmpty() {
        linkedList = LinkedList()
        
        XCTAssert(linkedList.startIndex == linkedList.startIndex)
        XCTAssert(linkedList.endIndex == linkedList.endIndex)
        XCTAssert(linkedList.startIndex == linkedList.endIndex)
        XCTAssertFalse(linkedList.startIndex < linkedList.endIndex)
    }
    
    func testStartAndEndIndex() {
        linkedList = LinkedList(elements: [0, 1, 2])
        
        XCTAssert(linkedList.startIndex.element == 0)
        XCTAssert(linkedList.startIndex.next.element == 1)
        XCTAssert(linkedList.startIndex.next.next.element == 2)
        XCTAssert(linkedList.startIndex.next.next.next.element == nil)
        XCTAssert(linkedList.endIndex.element == nil)
    }
    
    func testFirstAndEndIndexWhenEmpty() {
        linkedList = LinkedList()
        
        XCTAssert(linkedList.startIndex.element == nil)
        XCTAssert(linkedList.endIndex.element == nil)
    }
    
    func testIndexAfterIndex() {
        linkedList = LinkedList(elements: [0, 1, 2])
        
        var nextIndex = linkedList.index(after: linkedList.startIndex)
        XCTAssert(nextIndex.element == 1)
        
        nextIndex = linkedList.index(after: nextIndex)
        XCTAssert(nextIndex.element == 2)
        
        nextIndex = linkedList.index(after: nextIndex)
        XCTAssert(nextIndex.element == nil)
    }
    
    func testSubscript() {
        linkedList = LinkedList(elements: [0, 1, 2])
        
        XCTAssert(linkedList[0] == 0)
        XCTAssert(linkedList[1] == 1)
        XCTAssert(linkedList[2] == 2)
    }
    
    // MARK: - Tests: Copy on write
    func testCopyOnWriteWithPush() {
        linkedList = LinkedList(elements: [0, 1, 2])
        var newLinkedList = linkedList!
        
        XCTAssert(String(describing: linkedList!) == "0 -> 1 -> 2")
        XCTAssert(String(describing: newLinkedList) == "0 -> 1 -> 2")
        
        newLinkedList.push(-1)
        
        XCTAssert(String(describing: linkedList!) == "0 -> 1 -> 2")
        XCTAssert(String(describing: newLinkedList) == "-1 -> 0 -> 1 -> 2")
    }
    
    func testCopyOnWriteWithPushWhenEmpty() {
        linkedList = LinkedList()
        var newLinkedList = linkedList!
        
        XCTAssert(String(describing: linkedList!) == "nil")
        XCTAssert(String(describing: newLinkedList) == "nil")
        
        newLinkedList.push(0)
        
        XCTAssert(String(describing: linkedList!) == "nil")
        XCTAssert(String(describing: newLinkedList) == "0")
    }
    
    func testCopyOnWriteWithAppend() {
        linkedList = LinkedList(elements: [0, 1, 2])
        var newLinkedList = linkedList!
        
        XCTAssert(String(describing: linkedList!) == "0 -> 1 -> 2")
        XCTAssert(String(describing: newLinkedList) == "0 -> 1 -> 2")
        
        newLinkedList.append(3)
        
        XCTAssert(String(describing: linkedList!) == "0 -> 1 -> 2")
        XCTAssert(String(describing: newLinkedList) == "0 -> 1 -> 2 -> 3")
    }
    
    func testCopyOnWriteWithAppendWhenEmpty() {
        linkedList = LinkedList()
        var newLinkedList = linkedList!
        
        XCTAssert(String(describing: linkedList!) == "nil")
        XCTAssert(String(describing: newLinkedList) == "nil")
        
        newLinkedList.append(0)
        
        XCTAssert(String(describing: linkedList!) == "nil")
        XCTAssert(String(describing: newLinkedList) == "0")
    }
    
    func testCopyOnWriteWithInsert() {
        linkedList = LinkedList(elements: [0, 1, 2])
        var newLinkedList = linkedList!
        
        XCTAssert(String(describing: linkedList!) == "0 -> 1 -> 2")
        XCTAssert(String(describing: newLinkedList) == "0 -> 1 -> 2")
        
        try! newLinkedList.insert(10, at: 1)
        
        XCTAssert(String(describing: linkedList!) == "0 -> 1 -> 2")
        XCTAssert(String(describing: newLinkedList) == "0 -> 10 -> 1 -> 2")
    }
    
    func testCopyOnWriteWithInsertWhenEmpty() {
        linkedList = LinkedList()
        var newLinkedList = linkedList!
        
        XCTAssert(String(describing: linkedList!) == "nil")
        XCTAssert(String(describing: newLinkedList) == "nil")
        
        try! newLinkedList.insert(0, at: 0)
        
        XCTAssert(String(describing: linkedList!) == "nil")
        XCTAssert(String(describing: newLinkedList) == "0")
    }
    
    func testCopyOnWriteWithPop() {
        linkedList = LinkedList(elements: [0, 1, 2])
        var newLinkedList = linkedList!
        
        XCTAssert(String(describing: linkedList!) == "0 -> 1 -> 2")
        XCTAssert(String(describing: newLinkedList) == "0 -> 1 -> 2")
        
        newLinkedList.pop()
        
        XCTAssert(String(describing: linkedList!) == "0 -> 1 -> 2")
        XCTAssert(String(describing: newLinkedList) == "1 -> 2")
    }
    
    func testCopyOnWriteWithPopWhenEmpty() {
        linkedList = LinkedList()
        var newLinkedList = linkedList!
        
        XCTAssert(String(describing: linkedList!) == "nil")
        XCTAssert(String(describing: newLinkedList) == "nil")
        
        newLinkedList.pop()
        
        XCTAssert(String(describing: linkedList!) == "nil")
        XCTAssert(String(describing: newLinkedList) == "nil")
    }
    
    func testCopyOnWriteWithPopLast() {
        linkedList = LinkedList(elements: [0, 1, 2])
        var newLinkedList = linkedList!
        
        XCTAssert(String(describing: linkedList!) == "0 -> 1 -> 2")
        XCTAssert(String(describing: newLinkedList) == "0 -> 1 -> 2")
        
        newLinkedList.popLast()
        
        XCTAssert(String(describing: linkedList!) == "0 -> 1 -> 2")
        XCTAssert(String(describing: newLinkedList) == "0 -> 1")
    }
    
    func testCopyOnWriteWithPopLastWhenEmpty() {
        linkedList = LinkedList()
        var newLinkedList = linkedList!
        
        XCTAssert(String(describing: linkedList!) == "nil")
        XCTAssert(String(describing: newLinkedList) == "nil")
        
        newLinkedList.popLast()
        
        XCTAssert(String(describing: linkedList!) == "nil")
        XCTAssert(String(describing: newLinkedList) == "nil")
    }
    
    func testCopyOnWriteWithRemove() {
        linkedList = LinkedList(elements: [0, 1, 2])
        var newLinkedList = linkedList!
        
        XCTAssert(String(describing: linkedList!) == "0 -> 1 -> 2")
        XCTAssert(String(describing: newLinkedList) == "0 -> 1 -> 2")
        
        newLinkedList.remove(at: 1)
        
        XCTAssert(String(describing: linkedList!) == "0 -> 1 -> 2")
        XCTAssert(String(describing: newLinkedList) == "0 -> 2")
    }
    
    func testCopyOnWriteWithRemoveWhenEmpty() {
        linkedList = LinkedList()
        var newLinkedList = linkedList!
        
        XCTAssert(String(describing: linkedList!) == "nil")
        XCTAssert(String(describing: newLinkedList) == "nil")
        
        newLinkedList.remove(at: 0)
        
        XCTAssert(String(describing: linkedList!) == "nil")
        XCTAssert(String(describing: newLinkedList) == "nil")
    }
    
    // MARK: - Tests: Description
    func testDescriptionWithNoNode() {
        linkedList = LinkedList()
        let output = String(describing: linkedList!)
        
        XCTAssert(output == "nil")
    }
    
    func testDescriptionWithNodes() {
        linkedList = LinkedList(elements: [0, 1, 2])
        let output = String(describing: linkedList!)
        
        XCTAssert(output == "0 -> 1 -> 2")
    }
}
