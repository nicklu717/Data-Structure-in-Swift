//
//  BinaryTree.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2023/2/13.
//

public class BinaryTree<Element> {
    
    public enum TraversalMode {
        case preorder
        case inorder
        case postorder
    }
    
    public var root: BinaryNode<Element>?
    
    public init(element: Element?) {
        root = element.map { BinaryNode(element: $0) }
    }
    
    public func traverse(mode: TraversalMode) -> [Element] {
        var traversedElements: [Element] = []
        _traverse(by: mode, from: root, traversedElements: &traversedElements)
        return traversedElements
    }
    
    private func _traverse(by mode: TraversalMode, from node: BinaryNode<Element>?, traversedElements: inout [Element]) {
        guard let node = node else { return }
        switch mode {
        case .preorder:
            traversedElements.append(node.element)
            _traverse(by: mode, from: node.left, traversedElements: &traversedElements)
            _traverse(by: mode, from: node.right, traversedElements: &traversedElements)
        case .inorder:
            _traverse(by: mode, from: node.left, traversedElements: &traversedElements)
            traversedElements.append(node.element)
            _traverse(by: mode, from: node.right, traversedElements: &traversedElements)
        case .postorder:
            _traverse(by: mode, from: node.left, traversedElements: &traversedElements)
            _traverse(by: mode, from: node.right, traversedElements: &traversedElements)
            traversedElements.append(node.element)
        }
    }
}
