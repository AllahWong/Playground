//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
///********************************************协议************************************************/


protocol Named{
    var name: String{get}
}

protocol Aged{
    var age: Int {get
        
    }
    
}

struct Person: Named,Aged{
    var name: String //可读可写
    var age: Int
    
}

let p = Person(name: "Zhangsan", age: 30)

func wish(to: Named & Aged){
    print("name \(to.name),age \(to.age)")
}

wish(to: p)

//
////协议扩展
//protocol TextRepresentable{
//    var desc: String{get}
//}
//
//extension Person: TextRepresentable{
//    var desc: String{
//        return "name \(name) age \(age)"
//    }
//}
//
//print(p.desc)
//
//extension Array: TextRepresentable where Element: TextRepresentable{
//    var desc: String{
//        let itemDesc = self.map{$0.desc}
//        return itemDesc.joined(separator: ",")
//    }
//}
//
//
//let array = [Person(name: "Zhangsan", age: 43),Person(name: "lisi", age: 67)]
//print(array.desc)

//: [Next](@next)
