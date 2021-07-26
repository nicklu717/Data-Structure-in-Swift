//
//  RingBufferQueueTestCase.swift
//  DataStructureTests
//
//  Created by 陸瑋恩 on 2021/7/26.
//

import XCTest
@testable import DataStructure

final class RingBufferQueueTestCase: XCTestCase {
    
    // MARK: - Properties
    private var queue: RingBufferQueue<Int>!
    
    // MARK: - Life Cycle
    override func setUp() {
        super.setUp()
        queue = RingBufferQueue(capacity: 4)
    }
    
    override func tearDown() {
        queue = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testIsEmpty() {
        XCTAssert(queue.count == 0)
        XCTAssert(queue.isEmpty)
    }
    
    func testWrite() {
        XCTAssert(queue.count == 0)
        
        XCTAssert(queue.enqueue(0))
        XCTAssert(queue.enqueue(1))
        XCTAssert(queue.enqueue(2))
        XCTAssert(queue.enqueue(3))
        XCTAssert(queue.count == 4)
        XCTAssert(!queue.isEmpty)
        
        XCTAssert(!queue.enqueue(4))
        XCTAssert(queue.count == 4)
    }
    
    func testReadWhenEmpty() {
        XCTAssert(queue.dequeue() == nil)
        XCTAssert(queue.count == 0)
    }
    
    func testRead() {
        XCTAssert(queue.peek == nil)
        
        XCTAssert(queue.enqueue(0))
        XCTAssert(queue.enqueue(1))
        XCTAssert(queue.enqueue(2))
        XCTAssert(queue.enqueue(3))
        XCTAssert(queue.peek == 0)
        
        XCTAssert(queue.dequeue() == 0)
        XCTAssert(queue.peek == 1)
        XCTAssert(queue.dequeue() == 1)
        XCTAssert(queue.peek == 2)
        XCTAssert(queue.dequeue() == 2)
        XCTAssert(queue.peek == 3)
        XCTAssert(queue.dequeue() == 3)
        XCTAssert(queue.peek == nil)
        XCTAssert(queue.count == 0)
        
        XCTAssert(queue.dequeue() == nil)
        XCTAssert(queue.count == 0)
        XCTAssert(queue.dequeue() == nil)
        XCTAssert(queue.count == 0)
        XCTAssert(queue.dequeue() == nil)
        XCTAssert(queue.count == 0)
        XCTAssert(queue.dequeue() == nil)
        XCTAssert(queue.count == 0)
        XCTAssert(queue.dequeue() == nil)
        XCTAssert(queue.count == 0)
    }
}
