//
//  BinarySearchTree.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2023/2/13.
//

public class BinarySearchTree<Element> {
    
    private var root: BinaryNode<Element>?
    
    public init(element: Element? = nil) {
        root = element.map { BinaryNode(element: $0) }
    }
    
    public func insert(element: Element) {
        if let root = root {
            _insert(element: element, compareTo: root)
        } else {
            root = BinaryNode(element: element)
        }
    }
    
    private func _insert(element: Element, compareTo node: BinaryNode<Element>) {
        
    }
}
