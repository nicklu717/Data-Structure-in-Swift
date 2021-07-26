//
//  RingBufferTestCase.swift
//  DataStructureTests
//
//  Created by 陸瑋恩 on 2021/7/26.
//

import XCTest
@testable import DataStructure

final class RingBufferTestCase: XCTestCase {
    
    // MARK: - Properties
    private var ringBuffer: RingBuffer<Int>!
    
    // MARK: - Life Cycle
    override func setUp() {
        super.setUp()
        ringBuffer = RingBuffer(capacity: 4)
    }
    
    override func tearDown() {
        ringBuffer = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testIsEmpty() {
        XCTAssert(ringBuffer.count == 0)
        XCTAssert(ringBuffer.isEmpty)
    }
    
    func testWrite() {
        XCTAssert(ringBuffer.count == 0)
        
        XCTAssert(ringBuffer.write(0))
        XCTAssert(ringBuffer.write(1))
        XCTAssert(ringBuffer.write(2))
        XCTAssert(ringBuffer.write(3))
        XCTAssert(ringBuffer.count == 4)
        XCTAssert(!ringBuffer.isEmpty)
        
        XCTAssert(!ringBuffer.write(4))
        XCTAssert(ringBuffer.count == 4)
    }
    
    func testReadWhenEmpty() {
        XCTAssert(ringBuffer.read() == nil)
        XCTAssert(ringBuffer.count == 0)
    }
    
    func testRead() {
        XCTAssert(ringBuffer.write(0))
        XCTAssert(ringBuffer.write(1))
        XCTAssert(ringBuffer.write(2))
        XCTAssert(ringBuffer.write(3))
        
        XCTAssert(ringBuffer.read() == 0)
        XCTAssert(ringBuffer.read() == 1)
        XCTAssert(ringBuffer.read() == 2)
        XCTAssert(ringBuffer.read() == 3)
        XCTAssert(ringBuffer.count == 0)
        
        XCTAssert(ringBuffer.read() == nil)
        XCTAssert(ringBuffer.count == 0)
        XCTAssert(ringBuffer.read() == nil)
        XCTAssert(ringBuffer.count == 0)
        XCTAssert(ringBuffer.read() == nil)
        XCTAssert(ringBuffer.count == 0)
        XCTAssert(ringBuffer.read() == nil)
        XCTAssert(ringBuffer.count == 0)
        XCTAssert(ringBuffer.read() == nil)
        XCTAssert(ringBuffer.count == 0)
    }
}
