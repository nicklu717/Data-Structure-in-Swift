//
//  Node.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/6/21.
//

class Node<Value> {
    
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
