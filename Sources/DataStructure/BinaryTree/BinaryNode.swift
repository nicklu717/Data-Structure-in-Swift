//
//  BinaryNode.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2023/2/13.
//

public class BinaryNode<Element> {
    
    public let element: Element
    
    public var left: BinaryNode<Element>?
    public var right: BinaryNode<Element>?
    
    init(element: Element) {
        self.element = element
    }
}
