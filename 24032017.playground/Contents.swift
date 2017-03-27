//: Playground - noun: a place where people can play

import UIKit

func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}

var someString = "Hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)


struct Stack<Element>{
    var items: [Element] = []
    
    mutating func push(_ item: Element){
        items.append(item)
    }
    mutating func pop() -> Element{
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.pop()


var stackOfInt = Stack<Int>()
stackOfInt.push(12)
stackOfInt.push(6)


extension Stack {
    var topItem: Element?{
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int?{
    for (index, value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}

protocol Container{
    associatedtype ItemType
    subscript(i: Int) -> ItemType{get}
    var count: Int{get}
}

extension Stack : Container{
    internal subscript(i: Int) -> Element {
        return self.items[i]
    }
    internal var count: Int{
        get{
            return self.items.count
        }
    }
    typealias ItemType = Element
}

func allItemMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable{
    if someContainer.count != anotherContainer.count{
        return false
    }
    for i in 0..<someContainer.count{
        if someContainer[i] != anotherContainer[i]{
            return false
        }
    }
    return true
}

extension Array : Container{
    typealias ItemType = Element
}

var stacks = Stack<Int>()

stacks.push(1)
stacks.push(2)
stacks.push(3)


let arrayOfInts1 = [1,2,3]
let arrayOfInts2 = [1,2,4]

allItemMatch(stacks, arrayOfInts1)
allItemMatch(stacks, arrayOfInts2)
