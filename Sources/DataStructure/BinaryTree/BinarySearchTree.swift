//
//  BinarySearchTree.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2023/2/13.
//

public class BinarySearchTree<Element>: BinaryTree<Element> {
    
    public enum Comparison {
        case lessThan
        case equal
        case largerThan
    }
    
    private let compare: (Element, Element) -> Comparison
    
    public init(element: Element?, compare: @escaping (Element, Element) -> Comparison) {
        self.compare = compare
        super.init(element: element)
    }
    
    public func insert(element: Element) {
        if let root = root {
            _insert(element: element, compareTo: root)
        } else {
            root = BinaryNode(element: element)
        }
    }
    
    private func _insert(element: Element, compareTo node: BinaryNode<Element>) {
        switch compare(element, node.element) {
        case .lessThan:
            if let leftNode = node.left {
                _insert(element: element, compareTo: leftNode)
            } else {
                node.left = BinaryNode(element: element)
            }
        case .equal:
            return
        case .largerThan:
            if let rightNode = node.right {
                _insert(element: element, compareTo: rightNode)
            } else {
                node.right = BinaryNode(element: element)
            }
        }
    }
    
    public func sorted() -> [Element] {
        traverse(mode: .inorder)
    }
}
