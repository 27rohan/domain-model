//
//  main.swift
//  domain-model
//
//  Created by Rohan Thakkar on 10/15/16.
//  Copyright © 2016 Rohan Thakkar. All rights reserved.
//

import Foundation

struct Money{
    // Do not forget the () here
    /*var pennies : Int32 = 0
    
    var amount: Int32{
        get{return pennies/100
        }
        set(newvalue){ self.pennies = newvalue * 2}
    }
    */
    
    
    var amount: Double = 0.0
    var currency = ""
    /*
    var frozen : Bool{
        get{return false;}
    }
    */
    // constructor. Swift would have created one for you unless you put one yourself. Now that you have, you have to provide the arguments in the defined constructor
    init(amt: Double, currency: String){
        self.amount = amt
        self.currency = currency
    }
    
    func add(m2: Money) -> Money{
        let added_value = self.convert(currency: "USD")+m2.convert(currency: "USD")
        return Money(amt: added_value, currency: "USD")
        
    }

    func subtract(m2: Money) -> Money{
        let added_value = self.convert(currency: "USD")-m2.convert(currency: "USD")
        return Money(amt: added_value, currency: "USD")
        
    }
    
    func multiply(m2: Money) -> Money{
        let added_value = self.convert(currency: "USD")*m2.convert(currency: "USD")
        return Money(amt: added_value, currency: "USD")
        
    }
    
    func divide(m2: Money) -> Money{
        let added_value = self.convert(currency: "USD")/m2.convert(currency: "USD")
        return Money(amt: added_value, currency: "USD")
        
    }
    func convert(currency: String) -> Double{
        if self.currency == currency{
            return self.amount
        }
        if (self.currency == "USD"){
            
            if currency == "GBP"{
                return self.amount/2.0
            }
            
            else if currency == "EUR"{
                return self.amount*1.5
            }
            
            else if currency == "CAN"{
                return self.amount*1.25
            }
            
            return 0.0
        }//self.currency is USD
            
        if (self.currency == "GBP"){
            
            if currency == "USD"{
                return self.amount*2.0
            }
                
            else if currency == "EUR"{
                return self.amount*3.0
            }
                
            else if currency == "CAN"{
                return self.amount*2.5
            }
            
            return 0.0
        }//self.currency is GBP
        
        if (self.currency == "EUR"){
            
            if currency == "USD"{
                return self.amount*2.0/3.0
            }
                
            else if currency == "GBP"{
                return self.amount/3.0
            }
                
            else if currency == "CAN"{
                return self.amount*2.0*1.25/3.0
            }
            
            return 0.0
        }//self.currency is EUR
        
        
        if (self.currency == "CAN"){
            
            if currency == "USD"{
                return self.amount*4.0/5.0
            }
                
            else if currency == "GBP"{
                return self.amount*2.0/5.0
            }
                
            else if currency == "EUR"{
                return self.amount*6.0/5.0
            }
            
            return 0.0
        }//self.currency is CAN
        
        return 0.0
    }//func convert
    
}//struct Money



let m = Money(amt: 32.0, currency: "USD")
print("Number of euros = \(m.convert(currency:"GBP"))")
print(m.amount)
print(m.add(m2: Money(amt: 32.0, currency: "GBP")).amount)

/*
func add(m1: Money, m2: Money) -> Double{
    return m1.convert(currency:"USD") + m2.convert(currency:"USD")
}
func multiply(m1: Money, m2: Money) -> Double{
    return m1.convert(currency:"USD") * m2.convert(currency:"USD")
}
func subtract(m1: Money, m2: Money) -> Double{
    return m1.convert(currency:"USD") - m2.convert(currency:"USD")
}

func divide(m1: Money, m2: Money) -> Double{
    return m1.convert(currency:"USD") / m2.convert(currency:"USD")
}
*/
func math(){
    //take user input for array of moneys and one operation. Take care of divide by 0
}


class Job{
    
    init(title: String, salary: Double, hours: Double, type: String){
        if type == "per-hour"{
            self.title = title
            self.salary = calculateIncome(rate: salary, hours: hours)
        }
        else if type == "per-year"{
            self.title = title
            self.salary = salary
        }
    }
    static let NONE = Job(title: "(NONE)", salary: 0.0, hours: 0.0, type: "(NONE)")

    var title = ""
    
    var salary = 0.0
    

    
    func calculateIncome (rate: Double, hours: Double) -> Double{
        return hours*rate
    }
    
    func raise(increment: Double){
        self.salary += increment
    }

}//class Job


class Person{
    
    static let NONE = Person(fn: "(NONE)", ln: "(NONE)",age: 0)
    
    var firstName: String = ""
    var lastName: String = ""
    var age: UInt8 = 0
    
    var _job: Job? = nil
    
    var _spouse : Person? = nil
    
    var job : Job {
        get {
            if _job == nil {
                return Job.NONE
            }
            else {
                return _job!
            }
        }
        set(newvalue) {
            if(self.age>=16){
                _job = newvalue
            }
        }
    }
    var spouse : Person {
        get {
            if _spouse == nil {
                return Person.NONE
            }
            else {
                return _spouse!
            }
        }
        set(newvalue) {
            if(self.age>=18){
                _spouse = newvalue
            }
        }
    }
    
    /*
    var job: Job
    var spouse: Person
    */
    
    //static var totalpopulation = 0
    
    init(fn:String, ln:String, age: UInt8){
        self.firstName = fn
        self.lastName = ln
        self.age = age
        //Person.totalpopulation += 1
        
        
        /*
        if age>16{
            self.job = Job()
        }
        */
        /*
        if age>18{
            self.spouse = Person()
        }
         */
    }
    
    func representation(){
        print("First Name:"+String(self.firstName))
        print("Last Name:"+String(self.firstName))
        print("Age:"+String(self.age))
    }
    /*
    func sayHowdy(){
        print("\(firstName) says Hello")
        
    }
    
    func printpopulation(){
        print("Current population: \(Person.totalpopulation)")
    }
    
    
    func getOlder(){
        print("\(self.firstName) has a birthday. Yay!")
        self.age += 1
        print("\(self.firstName) is now \(self.age) years old")
    }
    */
    
}
var p = Person(fn:"Rohan",ln:"Thakkar",age:19)

p.representation()

class Family{

    var members = [Person]();
    
    
    init(a: Person, b: Person) {
        /*
        a.spouse = nil
        b.spouse = nil
        */
        a.spouse = b
        b.spouse = a
 
    }
    func householdIncome() -> Double{
        var total = 0.0
        for member in members{
            let job = member.job
            total += (job.salary)
            //total += job.salary
        }
        return total
    }
    
    func haveChild(fn: String,ln: String){
        self.members.append(Person(fn:fn,ln:ln, age: 0))
    }
}

var a = Person(fn:"Rohan",ln:"Thakkar",age:19)
var b = Person(fn:"Lol",ln:"Okay",age:39)

var f = Family(a: a,b:b)
print(f.householdIncome())
f.haveChild(fn:"ro",ln:"to")
