//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//PreconditionFailure("Can phai cai dat lai o lop con")

extension Double{
    var km: Double {return self * 1_000.0}
    var m: Double {return self}
    var cm: Double {return self / 100.0}
    var mm: Double {return self / 1_000.0}
    var ft: Double {return self / 3.28084}
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meter")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meter")


extension String{
    func getCharAt(_ number: Int) -> Character? {
//        let nnumber = number % self.characters.count
        if number >= self.characters.count || number < 0{
            return nil
        }
        let startIndex = self.startIndex
        let targetIndex = self.index(startIndex, offsetBy:number)
        return self[targetIndex]
    }
    
    subscript(index: Int) -> Character? {
        if index >= self.characters.count || index < 0 {
            return nil
        }
        
        let startIndex = self.startIndex
        let charAtIndex = self[self.index(startIndex, offsetBy: index)]
        return charAtIndex
    }
}

let nn = "hello"
nn.getCharAt(10)
nn[1]
print(nn)

// Protocol giong Interface

protocol Bay{
    func fly()
}

protocol SomeProtocol{
    func someProtocol()
}

protocol AnotherProtocol{
    func someProtocol()
}

protocol InheritingProtocol: SomeProtocol,AnotherProtocol {

}

// co protocol chi cho class implement no thoi
protocol SomeInheritedProtocol{
    func someProtocol()
}
protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol{

}


class Person{
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func show(){
        print("abcde")
    }
}

protocol Printable{
    func show()
}

let p = Person(name: "abc", age: 12)

func displayToConsole(out: Printable){
    out.show()
}

displayToConsole(out: Person)


// Lam cai shape protocol chua 3 ham, sau do lam lai bai tap 1