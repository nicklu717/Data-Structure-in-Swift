//
//  ArrayQueue.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/7/17.
//

struct ArrayQueue<Element>: Queue {
    
    private var elements: [Element] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: Element? {
        return elements.first
    }
    
    @discardableResult
    mutating func enqueue(_ element: Element) -> Success {
        elements.append(element)
        return true
    }
    
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}

extension ArrayQueue: CustomStringConvertible {
    
    var description: String {
        return String(describing: elements)
    }
}
