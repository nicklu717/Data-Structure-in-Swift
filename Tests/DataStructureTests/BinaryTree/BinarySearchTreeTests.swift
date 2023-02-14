//
//  BinarySearchTreeTests.swift
//  DataStructureTests
//
//  Created by 陸瑋恩 on 2023/2/14.
//

import XCTest
@testable import DataStructure

class BinarySearchTreeTests: XCTestCase {
    
    func testInitWithNoRoot() {
        let tree = BinarySearchTree<Int>(element: nil, compare: { _, _ in .equal })
        XCTAssertNil(tree.root)
    }
    
    func testInitWithIntRoot() {
        let tree = BinarySearchTree<Int>(element: 88, compare: { _, _ in .equal })
        XCTAssertEqual(tree.root?.element, 88)
    }
    
    func testInitWithStringRoot() {
        let tree = BinarySearchTree<String>(element: "88", compare: { _, _ in .equal })
        XCTAssertEqual(tree.root?.element, "88")
    }
    
    func testInsert() {
        let tree = BinarySearchTree<Int>(element: nil, compare: {
            switch $0 {
            case ..<$1:
                return .lessThan
            case $1:
                return .equal
            default:
                return .largerThan
            }
        })
        
        tree.insert(element: 9)
        XCTAssertEqual(tree.root?.element, 9)
        
        tree.insert(element: 3)
        tree.insert(element: 20)
        XCTAssertEqual(tree.root?.left?.element, 3)
        XCTAssertEqual(tree.root?.right?.element, 20)
        
        tree.insert(element: 8)
        XCTAssertEqual(tree.root?.left?.right?.element, 8)
        tree.insert(element: 92)
        XCTAssertEqual(tree.root?.right?.right?.element, 92)
    }
    
    func testInsertDuplicatedElement() {
        let tree = BinarySearchTree<Int>(element: nil, compare: {
            switch $0 {
            case ..<$1:
                return .lessThan
            case $1:
                return .equal
            default:
                return .largerThan
            }
        })
        
        tree.insert(element: 9)
        tree.insert(element: 9)
        tree.insert(element: 9)
        XCTAssertEqual(tree.root?.element, 9)
        XCTAssertNil(tree.root?.left)
        XCTAssertNil(tree.root?.right)
    }
    
    func testSorted() {
        let tree = BinarySearchTree<Int>(element: nil, compare: {
            switch $0 {
            case ..<$1:
                return .lessThan
            case $1:
                return .equal
            default:
                return .largerThan
            }
        })
        
        tree.insert(element: 9)
        tree.insert(element: 23)
        tree.insert(element: 3)
        tree.insert(element: 9)
        tree.insert(element: 1)
        tree.insert(element: 7)
        tree.insert(element: 12)
        XCTAssertEqual(tree.sorted(), [1, 3, 7, 9, 12, 23])
        XCTAssertEqual(tree.sorted(limit: 4), [1, 3, 7, 9])
    }
}
