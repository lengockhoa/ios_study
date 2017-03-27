//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


@objc protocol Printable{
    @objc optional func show()
}

class Person: Printable{
//    func show(){
//        print("show Person")
//    }
}

let p: Printable? = Person()
p?.show?()

// Protocol Extension, tu implement vao tat ca cac object co su dung protocol

protocol InThongTin{
    func inThongTin()
}

extension Int: InThongTin{
    func inThongTin(){
        self.sayGreeting()
        print("value \(self)")
    }
}

extension InThongTin{
    func sayGreeting(){
        print("say Hello")
    }
}

5.sayGreeting()