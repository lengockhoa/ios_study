//: Playground - noun: a place where people can play

import UIKit

class Customer{
    var tCustID : String = ""
    var CustID : String{
        get{
            return tCustID
        }
        set{
            self.tCustID = newValue
        }
    }
    var tCustName : String = ""
    var CustName : String{
        get{
            return tCustName
        }
        set{
            self.tCustName = newValue
        }
    }
    
    var tCustAddress : String = ""
    var CustAddress : String{
        get{
            return tCustAddress
        }
        set{
            self.tCustAddress = newValue
        }
    }
    var tDateofJoin : String = ""
    var DateofJoin : String{
        get{
            return tDateofJoin
        }
        set{
            self.tDateofJoin = newValue
        }
    }
    var tRevenue : Float = 0.0
    var Revenue : Float{
        get{
            return tRevenue
        }
        set{
            self.tRevenue = newValue
        }
    }
    init(){
        self.CustID = ""
        self.CustName = ""
        self.CustAddress = ""
        self.DateofJoin = ""
        self.Revenue = 0.0
    }
    
    init(_ custID : String,_ custName : String,_ custAddress : String,_ dateofJoin : String,_ revenue: Float) {
        self.CustID = custID
        self.CustName = custName
        self.CustAddress = custAddress
        self.DateofJoin = dateofJoin
        self.Revenue = revenue
    }
    
}

class CustomerApp{
    var custArr : [Customer] = []
    
    func addCustomer(customer: Customer) -> [Customer]{
        custArr.append(customer)
        return custArr
    }
    
    func AddListCustomer(customers: [Customer]) -> [Customer]{
        for cust in customers{
            custArr.append(cust)
        }
        return custArr
    }
    
    func searchCustomer(name: String) -> Customer?{
        for cust in self.custArr{
            if name == cust.CustName{
                return cust
            }
        }
        return nil
    }
    
    func printCustomerList(){
        print(custArr)
    }
    
    func calRevenue() -> Float{
        var sum : Float = 0
        for cust in custArr{
            sum = sum + cust.Revenue
        }
        return sum
    }
    
}

//customer1 = Customer(CustID: "123", CustName: "Name", CustAddress: "Add", DateofJoin: "Date", Revenue: 100)
var customer1 = Customer("0001", "Name 1", "Address 1", "20/02/2017", 4800000.0)
var customer2 = Customer("0002", "Name 2", "Address 2", "21/02/2017", 3600000.0)
var customer3 = Customer("0003", "Name 3", "Address 3", "23/02/2017", 5600000.0)
var customer4 = Customer("0004", "Name 4", "Address 4", "24/02/2017", 3200000.0)
var customer5 = Customer("0005", "Name 5", "Address 5", "25/02/2017", 7400000.0)

var app1 = CustomerApp()
app1.custArr = app1.addCustomer(customer: customer1)

var customerArr : [Customer] = [customer2, customer3, customer4, customer5]

app1.AddListCustomer(customers: customerArr)
app1.printCustomerList()

var resultSearch : Customer? = app1.searchCustomer(name: "Name 4")

if let resultSearch = resultSearch{
    print(resultSearch.CustID)
}
print("Total revenue : \(app1.calRevenue())")






// II. Twists - Draw an emty triangle
var n = 5
for i in 0..<n{
    for j in 0...i{
        if j == i || j == 0{
            print("*", terminator: "")
        }
        else{
            if i == n - 1{
                print("*", terminator: "")
            }else{
                print(" ", terminator: "")
            }
        }
    }
    print("\n")
}
