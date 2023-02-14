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
    
    public func traverse(mode: TraversalMode, limit: Int? = nil) -> [Element] {
        var traversedElements: [Element] = []
        _traverse(by: mode, from: root, traversedElements: &traversedElements, limit: limit)
        return traversedElements
    }
    
    private func _traverse(by mode: TraversalMode, from node: BinaryNode<Element>?, traversedElements: inout [Element], limit: Int? = nil) {
        guard let node = node else { return }
        switch mode {
        case .preorder:
            if let limit = limit, traversedElements.count >= limit {
                return
            }
            traversedElements.append(node.element)
            _traverse(by: mode, from: node.left, traversedElements: &traversedElements, limit: limit)
            _traverse(by: mode, from: node.right, traversedElements: &traversedElements, limit: limit)
        case .inorder:
            _traverse(by: mode, from: node.left, traversedElements: &traversedElements, limit: limit)
            if let limit = limit, traversedElements.count >= limit {
                return
            }
            traversedElements.append(node.element)
            _traverse(by: mode, from: node.right, traversedElements: &traversedElements, limit: limit)
        case .postorder:
            _traverse(by: mode, from: node.left, traversedElements: &traversedElements, limit: limit)
            _traverse(by: mode, from: node.right, traversedElements: &traversedElements, limit: limit)
            if let limit = limit, traversedElements.count >= limit {
                return
            }
            traversedElements.append(node.element)
        }
    }
}
