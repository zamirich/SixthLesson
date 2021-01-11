//
//  main.swift
//  SixthLesson
//
//  Created by ZamiRich on 10.01.2021.
//  Copyright © 2021 ZamiRich. All rights reserved.
//

import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

protocol Identifiable {
    var id: Int { get }
}

class Square: Identifiable {
    var id: Int
    var side: Int
    
    init(id: Int, side: Int) {
        self.id = id
        self.side = side
    }
}

struct Queue<T: Identifiable> {
    
    var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        var text: String = ""
        
        for element in elements {
            text += "\(element.id); "
        }
        return elements.isEmpty ? "There is nothing in the queue" : text
    }
}

var squareQueue = Queue<Square>()
squareQueue.push(Square(id: 1001, side: 5))
print(squareQueue)
squareQueue.push(Square(id: 1002, side: 6))
print(squareQueue)

let square1 = squareQueue.pop()
print(squareQueue)
let square2 = squareQueue.pop()
print(squareQueue)

squareQueue.push(Square(id: 1003, side: 5))
squareQueue.push(Square(id: 1004, side: 4))
squareQueue.push(Square(id: 1005, side: 7))

//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

func filterElements(in array: [Queue<Square>], sortElements: (Queue<Square>) -> Bool) -> [Queue<Square>] {
    var newQueue: [Queue<Square>] = []
    for element in array {
        //TODO
    }
    return newQueue
}

//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
extension Queue {
    subscript(index: Int) -> Int? {
        guard !elements.isEmpty && index >= 0 else { return nil }
        return index >= elements.count ? nil : elements[index].id
        //не могу принудительно извлечь, хотя вроде бы опционал
    }
}
print(squareQueue[-1])
print(squareQueue[2])
print(squareQueue[9])
