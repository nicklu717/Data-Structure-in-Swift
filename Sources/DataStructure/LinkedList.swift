//
//  LinkedList.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/6/21.
//

struct LinkedList<Value> {
    
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init(head: Node<Value>? = nil) {
        self.head = head
        self.tail = head
    }
    
    init(headValue: Value) {
        self.init(head: Node<Value>(value: headValue))
    }
}
