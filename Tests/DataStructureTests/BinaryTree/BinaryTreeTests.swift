//
//  BinaryTreeTests.swift
//  DataStructureTests
//
//  Created by 陸瑋恩 on 2023/2/14.
//

import XCTest
@testable import DataStructure

class BinaryTreeTests: XCTestCase {
    
    func testInitWithNoRoot() {
        let tree = BinaryTree<Int>(element: nil)
        XCTAssertNil(tree.root)
    }
    
    func testInitWithIntRoot() {
        let number = 12
        let tree = BinaryTree<Int>(element: number)
        XCTAssertEqual(tree.root?.element, number)
        
        XCTAssertEqual(tree.traverse(mode: .preorder), [number])
        XCTAssertEqual(tree.traverse(mode: .inorder), [number])
        XCTAssertEqual(tree.traverse(mode: .postorder), [number])
    }
    
    func testInitWithStringRoot() {
        let string = "Testing"
        let tree = BinaryTree<String>(element: string)
        XCTAssertEqual(tree.root?.element, string)
        
        XCTAssertEqual(tree.traverse(mode: .preorder), [string])
        XCTAssertEqual(tree.traverse(mode: .inorder), [string])
        XCTAssertEqual(tree.traverse(mode: .postorder), [string])
    }
    
    func testTraversal() {
        let rootNode = BinaryNode<Int>(element: 0)
        let leftNode = BinaryNode<Int>(element: 1)
        let rightNode = BinaryNode<Int>(element: 2)
        rootNode.left = leftNode
        rootNode.right = rightNode
        
        let tree = BinaryTree<Int>(element: nil)
        tree.root = rootNode
        XCTAssertEqual(tree.traverse(mode: .preorder), [0, 1, 2])
        XCTAssertEqual(tree.traverse(mode: .inorder), [1, 0, 2])
        XCTAssertEqual(tree.traverse(mode: .postorder), [1, 2, 0])
        
        let leftNodeOfLeftNode = BinaryNode<Int>(element: 3)
        let rightNodeOfLeftNode = BinaryNode<Int>(element: 4)
        leftNode.left = leftNodeOfLeftNode
        leftNode.right = rightNodeOfLeftNode
        let leftNodeOfRightNode = BinaryNode<Int>(element: 5)
        let rightNodeOfRightNode = BinaryNode<Int>(element: 6)
        rightNode.left = leftNodeOfRightNode
        rightNode.right = rightNodeOfRightNode
        
        XCTAssertEqual(tree.traverse(mode: .preorder), [0, 1, 3, 4, 2, 5, 6])
        XCTAssertEqual(tree.traverse(mode: .inorder), [3, 1, 4, 0, 5, 2, 6])
        XCTAssertEqual(tree.traverse(mode: .postorder), [3, 4, 1, 5, 6, 2, 0])
        
        XCTAssertEqual(tree.traverse(mode: .preorder, limit: 4), [0, 1, 3, 4])
        XCTAssertEqual(tree.traverse(mode: .inorder, limit: 4), [3, 1, 4, 0])
        XCTAssertEqual(tree.traverse(mode: .postorder, limit: 4), [3, 4, 1, 5])
    }
}
