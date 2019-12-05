//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
///********************************************范型************************************************/

//范型的类型约束
func firstIndex(of valueToFind: String, in array:[String])->Int?{
    for (index, value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}

let names = ["zhangsan","lisi"]
print(firstIndex(of: "lisi", in: names)!)




func firstIndexT<T : Equatable>(of valueToFind: T, in array:[T])->Int?{
    for (index, value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}
print(firstIndexT(of: "lisi", in: names)!)


//关联类型
protocol Container{
    
    //Swift里协议使用范型必须通过associatedtype
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int{get}
    subscript(i: Int) -> ItemType{
        get
    }
    
}


struct IntStack: Container{
    var items = [Int]()
    
    typealias ItemType = Int//不写这行也可以，因为有类型推断
    
    mutating func append(_ item: Int) {
        items.append(item)
    }
    
    var count: Int{
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
    
}


var intStack = IntStack()
intStack.append(1)
intStack.append(2)
print(intStack.count)
print(intStack[0])


protocol SuffixableContainer: Container{
    associatedtype Suffix: SuffixableContainer where Suffix.ItemType == ItemType
}


//where 子句
func allItemsMatch<C1: Container,C2: Container>(container:C1,anotherContainer: C2) -> Bool where  C1.ItemType == C2.ItemType, C1.ItemType: Equatable{
    if container.count != anotherContainer.count {
        return false
    }
    
    for i in 0..<container.count{
        if container[i] != anotherContainer[i]{
            return false
        }
    }
    return true
}

//范型下标

extension Container{
    subscript<Indices: Sequence>(indices: Indices) ->[ItemType] where
        Indices.Iterator.Element == Int{
            var result = [ItemType]()
            for index in indices{
                result.append(self[index])
            }
            return result
            
    }
}

print(intStack[(0)])

//: [Next](@next)
