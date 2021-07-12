//
//  Stack.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/7/13.
//

public struct Stack<Value> {
    
    // MARK: - Properties
    private var values: [Value]
    
    public var count: Int {
        return values.count
    }
    
    public var isEmpty: Bool {
        return values.isEmpty
    }
    
    public var last: Value? {
        return values.last
    }
    
    // MARK: - Initializer
    public init(values: [Value] = []) {
        self.values = values
    }
    
    // MARK: - Methods
    public mutating func push(_ value: Value) {
        values.append(value)
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        return values.popLast()
    }
}

// MARK: - ExpressibleByArrayLiteral
extension Stack: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Value...) {
        values = elements
    }
}

// MARK: - CustomStringConvertible
extension Stack: CustomStringConvertible {
    
    public var description: String {
        var output = ""
        values.forEach {
            if !output.isEmpty {
                output += ", "
            }
            output += "\($0)"
        }
        return "[\(output)]"
    }
}
