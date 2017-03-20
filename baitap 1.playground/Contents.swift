//: Playground - noun: a place where people can play

import UIKit

// 1. Cho 2 loai hinh: Hinh tron va hinh chu nhat
// Tinh Chu vi
// Tinh dien tich
// In thong tin
// Tao ra 1 mang cac loai hinh, Co 5 hinh tron + vuong
// a - in ra thong tin cua tat ca cac hinh trong mang
// b Deep copy mang tren


class Point{
    var x: Double
    var y: Double
    init(x: Double,y: Double){
        self.x = x
        self.y = y
    }
}

class Form{
    func area() -> Double{
        return 0
    }
    func perimeter() -> Double{
        return 0
    }
    func printout(){
        print ("Area: \(self.area()) and perimeter: \(self.perimeter())")
    }
    func clone() -> Form{
        return Form()
    }
}

class Rechtangle: Form{
    var width: Double
    var height: Double
    var center: Point
    init(width: Double, height: Double, center: Point){
        self.width = width
        self.height = height
        self.center = center
    }
    
    override func area() -> Double{
        return self.width*self.height
    }
    
    override func perimeter() -> Double{
        return 2*(self.width+self.height)
    }
    override func printout(){
        print ("This is rectangle")
        print ("Area: \(self.area()) and perimeter: \(self.perimeter())")
    }
    override func clone() -> Rechtangle{
        return Rechtangle(width: self.width, height: self.height,center: self.center)
    }
}

class Circle: Form{
    var radius: Double
    var center: Point
    init(radius: Double,center: Point){
        self.radius = radius
        self.center = center
    }
    let pi = 3.14
    
    override func area() -> Double{
        return pi*self.radius*self.radius
    }
    
    override func perimeter() -> Double{
        return 2*self.radius*pi
    }
    override func printout(){
        print ("This is circle")
        print ("Area: \(self.area()) and perimeter: \(self.perimeter())")
    }
    override func clone() -> Circle{
        return Circle(radius: self.radius,center: self.center)
    }
}


var myPoint = Point(x: 3.0,y: 4.0)
var myCircle = Circle(radius: 10,center: myPoint)
myCircle.printout()



var f1 = Form()
var f2 = Form()
var f3 = Form()
var f4 = Form()
var f5 = Form()
var myForms:[Form] = [f1,f2,f3,f4,myCircle]
for form in myForms{
    form.printout()
}

var myNewForm:[Form] = []
for form in myForms{
    myNewForm.append(form.clone())
}

myNewForm[1] = myCircle

myNewForm[1]
myForms[1]


