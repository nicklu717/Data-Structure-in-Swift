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
        count += 1
        if tail == nil {
            tail = head
        }
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
    
    @discardableResult
    public mutating func pop() -> Value? {
        let poppedValue = head?.value
        head = head?.next
        if !isEmpty {
            count -= 1
            if isEmpty {
                tail = nil
            }
        }
        
        return poppedValue
    }
    
    @discardableResult
    public mutating func popLast() -> Value? {
        if count <= 1 {
            return pop()
        } else {
            let poppedValue = tail?.value
            tail = getNode(for: count - 2)
            count -= 1
            return poppedValue
        }
    }
    
    @discardableResult
    public mutating func remove(at index: Int) -> Value? {
        if index < 0 || index >= count {
            return nil
        } else if index == 0 {
            return pop()
        } else if index == count - 1 {
            return popLast()
        } else {
            let previousNode = getNode(for: index - 1)
            let removedValue = previousNode?.next?.value
            previousNode?.next = previousNode?.next?.next
            count -= 1
            return removedValue
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
