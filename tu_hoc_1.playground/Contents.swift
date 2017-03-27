//: Playground - noun: a place where people can play

import UIKit

let point = (x: 1, y: 4)

switch point{
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
case let q2 where (point.x < 0) && (point.y > 0):
    print("\(q2) is in quadrant 2")
case let q3 where (point.x > 0) && (point.y < 0):
    print("\(q3) is in quadrant 3")
case let q4 where (point.x < 0) && (point.y < 0):
    print("\(q4) is in quadrant 4")
default:
    print("Case not covered")
}


let age = 25

//switch age{
//case let q1 where q1 in 18...35 && q1 > 21:
//    print("In cool demographic and of drinking age")
//default:
//    print("Not in their thirties")
//}



var myI = 3
for _ in 1...5{
    myI += 1
    print(myI)
}