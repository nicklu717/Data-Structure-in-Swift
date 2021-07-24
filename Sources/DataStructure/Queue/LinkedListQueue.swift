//
//  LinkedListQueue.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/7/24.
//

struct LinkedListQueue<Element>: Queue {
    
    private var elements = LinkedList<Element>()
    
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
        return elements.remove(at: 0)
    }
}

extension LinkedListQueue: CustomStringConvertible {
    
    var description: String {
        return String(describing: elements)
    }
}
