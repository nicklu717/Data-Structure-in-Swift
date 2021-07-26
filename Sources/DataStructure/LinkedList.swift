//
//  LinkedList.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/6/21.
//

public struct LinkedList<Element> {
    
    enum Error: Swift.Error {
        case invalidIndex
        case indexOutOfRange
    }
    
    // MARK: - Properties
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    public private(set) var count: Int = 0
    public var isEmpty: Bool {
        return count == 0
    }
    
    // MARK: - Initializer
    public init(elements: [Element] = []) {
        elements.forEach {
            append($0)
        }
    }
    
    // MARK: - Methods
    public func element(at index: Int) -> Element? {
        return node(at: index)?.element
    }
    
    public mutating func push(_ element: Element) {
        copyOnWrite()
        
        head = Node<Element>(element: element, next: head)
        count += 1
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ element: Element) {
        copyOnWrite()
        
        guard !isEmpty else {
            push(element)
            return
        }
        tail?.next = Node<Element>(element: element)
        tail = tail?.next
        count += 1
    }
    
    public mutating func insert(_ element: Element, at index: Int) throws {
        copyOnWrite()
        
        if index < 0 {
            throw Error.invalidIndex
        } else if index > count {
            throw Error.indexOutOfRange
        } else if index == 0 {
            push(element)
        } else if index == count {
            append(element)
        } else {
            let previousNode = node(at: index - 1)
            previousNode?.next = Node<Element>(element: element, next: previousNode?.next)
            count += 1
        }
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        copyOnWrite()
        
        let poppedElement = head?.element
        head = head?.next
        if !isEmpty {
            count -= 1
            if isEmpty {
                tail = nil
            }
        }
        
        return poppedElement
    }
    
    @discardableResult
    public mutating func popLast() -> Element? {
        copyOnWrite()
        
        if count <= 1 {
            return pop()
        } else {
            let poppedElement = tail?.element
            tail = node(at: count - 2)
            tail?.next = nil
            count -= 1
            return poppedElement
        }
    }
    
    @discardableResult
    public mutating func remove(at index: Int) -> Element? {
        copyOnWrite()
        
        if index < 0 || index >= count {
            return nil
        } else if index == 0 {
            return pop()
        } else if index == count - 1 {
            return popLast()
        } else {
            let previousNode = node(at: index - 1)
            let removedElement = previousNode?.next?.element
            previousNode?.next = previousNode?.next?.next
            count -= 1
            return removedElement
        }
    }
    
    // MARK: - Helpers
    private func node(at index: Int) -> Node<Element>? {
        guard index >= 0 else { return nil }
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }
    
    private mutating func copyOnWrite() {
        guard !isKnownUniquelyReferenced(&head) else { return }
        
        guard var oldNode = head else { return }
        head = Node<Element>(element: oldNode.element)
        
        var newNode = head
        while let nextOldNode = oldNode.next {
            newNode?.next = Node<Element>(element: nextOldNode.element)
            newNode = newNode?.next
            oldNode = nextOldNode
        }
        tail = newNode
    }
}

// MARK: - Collection
extension LinkedList: Collection {
    
    public struct Index: Comparable {
        
        private let node: Node<Element>?
        
        public init(node: Node<Element>?) {
            self.node = node
        }
        
        public static func == (lhs: LinkedList<Element>.Index, rhs: LinkedList<Element>.Index) -> Bool {
            return lhs.node === rhs.node
        }
        
        public static func < (lhs: LinkedList<Element>.Index, rhs: LinkedList<Element>.Index) -> Bool {
            guard lhs != rhs else { return false }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
        
        public var next: Index {
            return Index(node: node?.next)
        }
        
        public var element: Element? {
            return node?.element
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
    
    public subscript(position: Int) -> Element? {
        guard position > 0 else { return self[startIndex] }
        var index = startIndex
        for _ in 0..<position {
            index = index.next
        }
        return self[index]
    }
    
    public subscript(position: Index) -> Element {
        return position.element!
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
