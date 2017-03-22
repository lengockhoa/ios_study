//: Playground - noun: a place where people can play

import UIKit

struct Diem{
    var x: Double
    var y: Double
}

protocol Hinh{
    func chuVi() -> Double
    func dienTich() -> Double
    func inThongTin()
    func clone() -> Hinh
}

class HinhTron: Hinh{
    var tam: Diem
    var banKinh: Double
    
    let pi = 3.14
    
    init(tam: Diem,banKinh: Double){
        self.tam = tam
        self.banKinh = banKinh
    }
    
    func chuVi() -> Double{
        return 2 * banKinh * pi
    }
    
    func dienTich() -> Double{
        return banKinh * banKinh * pi
    }
    
    func inThongTin(){
        print("Đây là hình tròn với diện tích là: \(dienTich()) và chu vi là : \(chuVi())")
    }
    
    func clone() -> Hinh{
        return self
    }
}

class HinhChuNhat: Hinh{
    var dai: Double
    var rong: Double
    
    init(dai: Double, rong: Double){
        self.dai = dai
        self.rong = rong
    }
    
    func chuVi() -> Double{
        return 2 * (dai + rong)
    }
    
    func dienTich() -> Double{
        return dai * rong
    }
    
    func inThongTin(){
        print("Đây là hình vuông với diện tích là: \(dienTich()) và chu vi là : \(chuVi())")
    }
    
    func clone() -> Hinh{
        return self
    }
}

let hinhTron1 = HinhTron(tam: Diem(x: 2,y: 3), banKinh: 15)
let hinhTron2 = HinhTron(tam: Diem(x: 5,y: 8), banKinh: 9)
let hinhChuNhat1 = HinhChuNhat(dai: 15, rong: 6)
let hinhChuNhat2 = HinhChuNhat(dai: 22, rong: 11)
let hinhChuNhat3 = HinhChuNhat(dai: 18, rong: 13)

let hinhs: [Hinh] = [hinhTron1,hinhTron2,hinhChuNhat1,hinhChuNhat2,hinhChuNhat3]
var hinhscopy: [Hinh] = []
for hinh in hinhs{
    hinhscopy.append(hinh.clone())
}

hinhs[1].chuVi()
//hinhs[1].banKinh = 13
hinhscopy[1].chuVi()
