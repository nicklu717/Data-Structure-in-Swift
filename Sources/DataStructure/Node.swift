//
//  Node.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/6/21.
//

open class Node<Value> {
    
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        var output = "\(value)"
        if let next = next {
            output += " -> \(next) "
        }
        return output
    }
}
