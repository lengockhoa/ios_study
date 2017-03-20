//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)
var number:Int32 = 2_0_40_000
let startIndex = str.startIndex
let targetIndex = str.index(startIndex, offsetBy:4)
print(str[targetIndex])

var tuple = (123,"string")

switch tuple {
case (123,"string"):
    print("123-myString");
case(123,_):
    print("123-")
case(_,"destring"):
    print("*-String")
default:
    print("default")
}

for i in 0...10 where i%2==0 && (i==4 || i==6){
    print("i");
}
var new_tuple:(String,Int,Double) = ("string này mới nè",33,9.99)
print(new_tuple.2)

let newNumber = 877
var Nnumber:Int = 1
while Nnumber<10 {
    print(Nnumber)
    Nnumber = Nnumber + 1
}
//Hàm reversed() dùng để chạy ngược lại 1 khoảng

var intValue:Int?
intValue = 4
print(intValue!)


var optionalValue:Int?
optionalValue = 3
// Ở đây là cú pháp chứ không phải so sánh
if let optionalValue = optionalValue
{
    print(optionalValue)
}


var nstr : String? = "Message"
nstr = nil

if let nstr = nstr
{
    var newStr = nstr.uppercased()
    print(newStr)
}
var NewStr2 = nstr?.uppercased()


var msg:String? = "message"
msg = nil
var value = msg ?? "khong co"


var item = ["0fff1","02"]
for it in item{
    print(it)
}

for i in (0..<item.count).reversed(){
    print(item[i])
}

for (index,value) in item.enumerated(){
    print(value)
}

var optionalValue1:Int?
optionalValue1 = 3

var dict1 : [String : Int?] = [:]
dict1["key1"] = 123

let v = dict1["key1"]
print(v!!)


var set1 : Set<String> = ["1","2","3","1","2","3","1"]
for item in set1{
    print(item) // kể cả nhiều thì nó vẫn chỉ ra 3 giá trị
}

// Gán set bằng mảng thì chỉ cần gán



struct Rechtangle{
    var width : Int{
        willSet{
            print("Current value \(width)")
            print("New value: \(newValue)")
        }
        didSet{
            print("Current value \(width)")
            print("Old value: \(oldValue)")
        }
    }
//    var area2: Int{
//        set{
//            l
//        }
//    }
    var height: Int
    var area: Int{
        get{
            return width*height
        }
    }
    mutating func update(width newVal: Int){
        width = newVal
    }
}

var rect = Rechtangle(width: 3,height: 4)
rect.width = 20
rect.width = 35
print(rect.area)
//print(rect.area2)
rect.update(width: 100)
print(rect.area)



struct Person{
    var name = "John"
    var age = 20
    init(){
        Person.numberOfPerson += 1
    }
    init(name: String){
        self.name = name
    }
    static var numberOfPerson = 0
    static func totalPerson(){
        print("Total of person \(numberOfPerson)")
    }
}
var p1 = Person()
var p2 = Person()

Person.totalPerson()


struct Fahrenheit{
    var temperature: Double
    init(){
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)")




class PersonClass{
    var name : String
    var age : Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    convenience init(name: String){
        self.init(name: name, age: 12)
    }
}

class StudentClass : PersonClass{
    var className: String
    init(className: String, name: String, age: Int){
        self.className = className
        super.init(name: name, age: age)
    }
}

var myPerson = PersonClass(name: "List")
print(myPerson.age)

var newPerson = myPerson
newPerson.name = "tenkhac"
print(myPerson.name)
print(newPerson.name)

var myPersonStruct = Person(name: "List")
var newPersonStruct = myPersonStruct
newPersonStruct.name = "new Name"
print(myPersonStruct.name)
print(newPersonStruct.name)


var myStudent = StudentClass(className: "temp",name: "abc",age: 15)
print("The student has name \(myStudent.name) and has age \(myStudent.age) and in class \(myStudent.className)")


let a = 5
let b = 5
a == 5



