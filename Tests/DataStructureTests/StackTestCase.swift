//
//  StackTestCase.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/7/13.
//

import XCTest
@testable import DataStructure

final class StackTestCase: XCTestCase {
    
    // MARK: - Properties
    private var stack: Stack<Int>!
    
    // MARK: - Life Cycle
    override func tearDown() {
        stack = nil
        super.tearDown()
    }
    
    // MARK: - Tests: Properties
    func testPropertiesWhenEmpty() {
        stack = Stack<Int>()
        
        XCTAssert(stack.count == 0)
        XCTAssert(stack.isEmpty)
        XCTAssert(stack.last == nil)
    }
    
    func testCountWhenEmpty() {
        stack = Stack<Int>(elements: [0, 1, 2])
        
        XCTAssert(stack.count == 3)
        XCTAssert(!stack.isEmpty)
        XCTAssert(stack.last == 2)
    }
    
    // MARK: - Tests: Push
    func testPush() {
        stack = Stack<Int>()
        stack.push(0)
        stack.push(1)
        stack.push(2)
        
        XCTAssert(stack.count == 3)
        XCTAssert(!stack.isEmpty)
        XCTAssert(stack.last == 2)
    }
    
    // MARK: - Tests: Pop
    func testPop() {
        stack = Stack<Int>(elements: [0, 1, 2])
        let poppedElement = stack.pop()
        
        XCTAssert(poppedElement == 2)
        XCTAssert(stack.count == 2)
        XCTAssert(!stack.isEmpty)
        XCTAssert(stack.last == 1)
    }
    
    func testPopWhenEmpty() {
        stack = Stack<Int>()
        let poppedElement = stack.pop()
        
        XCTAssert(poppedElement == nil)
        XCTAssert(stack.count == 0)
        XCTAssert(stack.isEmpty)
        XCTAssert(stack.last == nil)
    }
    
    func testPopTheOnlyElement() {
        stack = Stack<Int>(elements: [0])
        let poppedElement = stack.pop()
        
        XCTAssert(poppedElement == 0)
        XCTAssert(stack.count == 0)
        XCTAssert(stack.isEmpty)
        XCTAssert(stack.last == nil)
    }
    
    // MARK: - Tests: ExpressibleByArrayLiteral
    func testExpressibleByArrayLiteral() {
        stack = [0, 1, 2]
        
        XCTAssert(stack.count == 3)
        XCTAssert(!stack.isEmpty)
        XCTAssert(stack.last == 2)
    }
    
    // MARK: - Tests: Description
    func testDescription() {
        stack = Stack<Int>()
        let output = String(describing: stack!)
        
        XCTAssert(output == "[]")
    }
    
    func testDescriptionWhenEmpty() {
        stack = Stack<Int>(elements: [0, 1, 2])
        let output = String(describing: stack!)
        
        XCTAssert(output == "[0, 1, 2]")
    }
}
