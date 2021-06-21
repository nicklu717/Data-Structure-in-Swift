//
//  LinkedList.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/6/21.
//

public struct LinkedList<Value> {
    
    public private(set) var head: Node<Value>?
    public private(set) var tail: Node<Value>?
    
    public init(head: Node<Value>? = nil) {
        self.head = head
        self.tail = head
    }
    
    public init(headValue: Value) {
        self.init(head: Node<Value>(value: headValue))
    }
}
