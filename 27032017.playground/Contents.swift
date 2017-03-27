//: Playground - noun: a place where people can play

import UIKit

// 2 từ khóa WEAK & STRONG

class Person{
    var name: String
    
    weak var friend: Person?
    
    init(name: String) {
        self.name = name
        print("Hello: \(name)")
    }
    
    deinit {
        print("Bye \(name)")
    }
}

weak var p = Person(name: "Torres")
var p1:Person? = Person(name: "Messi")
p1 = nil

func sayHello(){
    _ = Person(name: "TOrrrr")
}

sayHello()

let p11 = Person(name: "AAAA")
let p21 = Person(name: "BBBB")

p11.friend = p21
p21.friend = p11




// Review swift

var arrays = [1, 3, 5, 6]

var closure = {(a: Int,b: Int)->Bool in
    
}

arrays.sort({by;: (a,b)-> Bool in
    return a > b
})
arrays.sort(by: >)