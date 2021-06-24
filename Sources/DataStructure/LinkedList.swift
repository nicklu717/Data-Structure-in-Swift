//
//  LinkedList.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/6/21.
//

public struct LinkedList<Value> {
    
    enum Error: Swift.Error {
        case invalidIndex
        case indexOutOfRange
    }
    
    private var head: Node<Value>?
    private var tail: Node<Value>?
    
    public private(set) var count: Int = 0
    public var isEmpty: Bool {
        return count == 0
    }
    
    public init() {}
    
    public init(values: [Value]) {
        values.forEach {
            append($0)
        }
    }
    
    subscript(index: Int) -> Value {
        let node = getNode(for: index)
        guard let value = node?.value else { fatalError("Index out of range") }
        return value
    }
    
    public mutating func push(_ value: Value) {
        head = Node<Value>(value: value, next: head)
        if tail == nil {
            tail = head
        }
        count += 1
    }
    
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail?.next = Node<Value>(value: value)
        tail = tail?.next
        count += 1
    }
    
    public mutating func insert(_ value: Value, at index: Int) throws {
        if index < 0 {
            throw Error.invalidIndex
        } else if index > count {
            throw Error.indexOutOfRange
        } else if index == 0 {
            push(value)
        } else if index == count {
            append(value)
        } else {
            let previousNode = getNode(for: index - 1)
            previousNode?.next = Node<Value>(value: value, next: previousNode?.next)
            count += 1
        }
    }
    
    private func getNode(for index: Int) -> Node<Value>? {
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        if let head = head {
            return "\(head)"
        } else {
            return "nil"
        }
    }
}
