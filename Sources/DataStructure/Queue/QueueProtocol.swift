//
//  QueueProtocol.swift
//  DataStructure
//
//  Created by 陸瑋恩 on 2021/7/17.
//

typealias Success = Bool

protocol Queue {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var peek: Element? { get }
    
    @discardableResult
    mutating func enqueue(_ element: Element) -> Success
    
    mutating func dequeue() -> Element?
}
