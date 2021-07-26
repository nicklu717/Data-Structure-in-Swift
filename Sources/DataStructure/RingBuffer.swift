//
//  RingBuffer.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/7/26.
//

struct RingBuffer<Element> {
    
    private var elements: [Element?]
    
    let capacity: Int
    
    private(set) var count = 0
    var isEmpty: Bool {
        return count == 0
    }
    
    private var readIndex = 0
    private var writeIndex = 0
    
    init(capacity: Int) {
        self.capacity = capacity
        self.elements = [Element?](repeating: nil, count: capacity)
    }
    
    @discardableResult
    mutating func read() -> Element? {
        let element = elements[readIndex]
        if element != nil {
            elements[readIndex] = nil
            readIndex = (readIndex + 1) % capacity
            count -= 1
        }
        return element
    }
    
    @discardableResult
    mutating func write(_ element: Element) -> Success {
        guard elements[writeIndex] == nil else { return false }
        elements[writeIndex] = element
        writeIndex = (writeIndex + 1) % capacity
        count += 1
        return true
    }
}
