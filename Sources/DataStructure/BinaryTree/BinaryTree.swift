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
    
    private var rootNode: BinaryNode<Element>?
    
    public init(element: Element?) {
        rootNode = element.map { BinaryNode(element: $0) }
    }
    
    public func traverse(mode: TraversalMode) {
        _traverse(mode: mode, node: rootNode)
    }
    
    private func _traverse(mode: TraversalMode, node: BinaryNode<Element>?) {
        guard let node = node else { return }
        switch mode {
        case .preorder:
            print(node.element)
            _traverse(mode: mode, node: node.left)
            _traverse(mode: mode, node: node.right)
        case .inorder:
            _traverse(mode: mode, node: node.left)
            print(node.element)
            _traverse(mode: mode, node: node.right)
        case .postorder:
            _traverse(mode: mode, node: node.left)
            _traverse(mode: mode, node: node.right)
            print(node.element)
        }
    }
}
