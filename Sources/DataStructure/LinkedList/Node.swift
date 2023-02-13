//
//  Node.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/6/21.
//

open class Node<Element> {
    
    public var element: Element
    public var next: Node?
    
    public init(element: Element, next: Node? = nil) {
        self.element = element
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        var output = "\(element)"
        if let next = next {
            output += " -> \(next)"
        }
        return output
    }
}
