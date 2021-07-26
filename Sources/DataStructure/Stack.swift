//
//  Stack.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/7/13.
//

public struct Stack<Element> {
    
    // MARK: - Properties
    private var elements: [Element]
    
    public var count: Int {
        return elements.count
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var last: Element? {
        return elements.last
    }
    
    // MARK: - Initializer
    public init(elements: [Element] = []) {
        self.elements = elements
    }
    
    // MARK: - Methods
    public mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return elements.popLast()
    }
}

// MARK: - ExpressibleByArrayLiteral
extension Stack: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Element...) {
        self.elements = elements
    }
}

// MARK: - CustomStringConvertible
extension Stack: CustomStringConvertible {
    
    public var description: String {
        var output = ""
        elements.forEach {
            if !output.isEmpty {
                output += ", "
            }
            output += "\($0)"
        }
        return "[\(output)]"
    }
}
