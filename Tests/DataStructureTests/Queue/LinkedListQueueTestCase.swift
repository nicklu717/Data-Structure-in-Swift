//
//  LinkedListQueueTestCase.swift
//  DataStructureTests
//
//  Created by 陸瑋恩 on 2021/7/24.
//

import XCTest
@testable import DataStructure

final class LinkedListQueueTestCase: XCTestCase {
    
    // MARK: - Properties
    private var queue: LinkedListQueue<Int>!
    
    // MARK: - Life Cycle
    override func setUp() {
        super.setUp()
        queue = LinkedListQueue<Int>()
    }
    
    override func tearDown() {
        queue = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testIsEmptyWhenEmpty() {
        XCTAssert(queue.isEmpty)
    }
    
    func testPeekWhenEmpty() {
        XCTAssert(queue.peek == nil)
    }
    
    func testEnqueue() {
        XCTAssert(queue.enqueue(0))
        XCTAssert(!queue.isEmpty)
        XCTAssert(queue.peek == 0)
    }
    
    func testEnqueueMultipleTimes() {
        XCTAssert(queue.enqueue(0))
        XCTAssert(queue.enqueue(1))
        XCTAssert(queue.enqueue(2))
        XCTAssert(!queue.isEmpty)
        XCTAssert(queue.peek == 0)
    }
    
    func testDequeueWhenEmpty() {
        XCTAssert(queue.dequeue() == nil)
        XCTAssert(queue.isEmpty)
        XCTAssert(queue.peek == nil)
    }
    
    func testDequeue() {
        XCTAssert(queue.enqueue(0))
        XCTAssert(queue.enqueue(1))
        XCTAssert(queue.enqueue(2))
        
        XCTAssert(queue.dequeue() == 0)
        XCTAssert(!queue.isEmpty)
        XCTAssert(queue.peek == 1)
        
        XCTAssert(queue.dequeue() == 1)
        XCTAssert(!queue.isEmpty)
        XCTAssert(queue.peek == 2)
        
        XCTAssert(queue.dequeue() == 2)
        XCTAssert(queue.isEmpty)
        XCTAssert(queue.peek == nil)
    }
    
    func testDescription() {
        queue.enqueue(0)
        queue.enqueue(1)
        queue.enqueue(2)
        let output = String(describing: queue!)
        
        XCTAssert(output == "0 -> 1 -> 2")
    }
    
    func testDescriptionWhenEmpty() {
        let output = String(describing: queue!)
        
        XCTAssert(output == "nil")
    }
}
