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
    
    // MARK: - Properties
    private var head: Node<Value>?
    private var tail: Node<Value>?
    
    public private(set) var count: Int = 0
    public var isEmpty: Bool {
        return count == 0
    }
    
    // MARK: - Initializer
    public init() {}
    
    public init(values: [Value]) {
        values.forEach {
            append($0)
        }
    }
    
    // MARK: - Methods
    public func value(at index: Int) -> Value? {
        return node(at: index)?.value
    }
    
    public mutating func push(_ value: Value) {
        copyNodes()
        
        head = Node<Value>(value: value, next: head)
        count += 1
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        copyNodes()
        
        guard !isEmpty else {
            push(value)
            return
        }
        tail?.next = Node<Value>(value: value)
        tail = tail?.next
        count += 1
    }
    
    public mutating func insert(_ value: Value, at index: Int) throws {
        copyNodes()
        
        if index < 0 {
            throw Error.invalidIndex
        } else if index > count {
            throw Error.indexOutOfRange
        } else if index == 0 {
            push(value)
        } else if index == count {
            append(value)
        } else {
            let previousNode = node(at: index - 1)
            previousNode?.next = Node<Value>(value: value, next: previousNode?.next)
            count += 1
        }
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        copyNodes()
        
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
        copyNodes()
        
        if count <= 1 {
            return pop()
        } else {
            let poppedValue = tail?.value
            tail = node(at: count - 2)
            tail?.next = nil
            count -= 1
            return poppedValue
        }
    }
    
    @discardableResult
    public mutating func remove(at index: Int) -> Value? {
        copyNodes()
        
        if index < 0 || index >= count {
            return nil
        } else if index == 0 {
            return pop()
        } else if index == count - 1 {
            return popLast()
        } else {
            let previousNode = node(at: index - 1)
            let removedValue = previousNode?.next?.value
            previousNode?.next = previousNode?.next?.next
            count -= 1
            return removedValue
        }
    }
    
    // MARK: - Helpers
    private func node(at index: Int) -> Node<Value>? {
        guard index >= 0 else { return nil }
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }
    
    private mutating func copyNodes() {
        guard var oldNode = head else { return }
        head = Node<Value>(value: oldNode.value)
        
        var newNode = head
        while let nextOldNode = oldNode.next {
            newNode?.next = Node<Value>(value: nextOldNode.value)
            newNode = newNode?.next
            oldNode = nextOldNode
        }
        tail = newNode
    }
}

// MARK: - Collection
extension LinkedList: Collection {
    
    public struct Index: Comparable {
        
        private let node: Node<Value>?
        
        public init(node: Node<Value>?) {
            self.node = node
        }
        
        public static func == (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            return lhs.node === rhs.node
        }
        
        public static func < (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            guard lhs != rhs else { return false }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
        
        public var next: Index {
            return Index(node: node?.next)
        }
        
        public var value: Value? {
            return node?.value
        }
    }
    
    public var startIndex: Index {
        return Index(node: head)
    }
    
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        return i.next
    }
    
    public subscript(position: Int) -> Value? {
        guard position > 0 else { return self[startIndex] }
        var index = startIndex
        for _ in 0..<position {
            index = index.next
        }
        return self[index]
    }
    
    public subscript(position: Index) -> Value {
        return position.value!
    }
}

// MARK: - CustomStringConvertible
extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        if let head = head {
            return "\(head)"
        } else {
            return "nil"
        }
    }
}
