import UIKit

var str = "Hello, playground"


///********************************************函数************************************************/
//
////如果整个函数体是一个单一表达式，那么函数隐式返回这个表达式。
//func greet(person: String) -> String{
//    "Hello" + person + "!"  //Xcode 11及以上支持隐式表达式
//
////    return "Hello" + person + "!"
//}
//
//print(greet(person: "张三"))
//
//
//
////为了让函数返回多个值作为一个复合的返回值，你可以使用元组类型作为返回类型。
////如果元组在函数的返回类型中有可能“没有值”，你可以用一个可选元组返回类型来说明整个元组的可能 是 nil 。写法是在可选元组类型的圆括号后边添加一个问号( ?)例如 (Int, Int)? 或者 (String, Int, Bool)? 。
//func minMax(array:[Int]) ->(min: Int , max: Int)?{
//    if array.isEmpty {
//        return nil
//    }
//
//    var minValue = array[0]
//    var maxValue = array[0]
//    for value in array{
//        if value < minValue {
//            minValue = value
//        }
//        if value > maxValue{
//            maxValue = value
//        }
//    }
//    return (minValue,maxValue)
//}
//
//if let minMaxValue = minMax(array: []) {
//    print("min = \(minMaxValue.min),max = \(minMaxValue.max)")
//}
//
//
//
////没有定义返回类 型的函数实际上会返回一个特殊的类型 Void。它其实是一个空的元组，作用相当于没有元素的 元组，可以写作 () 。
//
//
//
//func greet(person: String , from hometown: String) -> String{
//    return "Hello \(person)! Glad you from \(hometown)"
//}
//
//print(greet(person: "bill", from: "Cupertino"))
//
//
////first second L：实际参数标签
////func addTwoNumber(first num1: Int ,second num2 : Int) -> Int{
////    return num1 + num2
////}
////print(addTwoNumber(first: 1, second: 2))
//
//// 省略，实际参数标签和形式参数名相同
//func addTwoNumber(num1: Int ,num2 : Int = 3) -> Int{
//    return num1 + num2
//}
//print(addTwoNumber(num1: 1, num2: 2))
//print(addTwoNumber(num1: 6))
//
//////_ 表示省略实际参数标签
////func addTwoNumber(_ num1: Int ,_ num2 : Int) -> Int{
////    return num1 + num2
////}
////print(addTwoNumber(1, 2))
//
//
////num为Int 类型的数组
//func addNumbers(nums: Int ...)-> Int{
//    var sum = 0
//    for num in nums {
//        sum  += num
//    }
//    return sum
//}
//
//print(addNumbers(nums: 1,2,3,4))
//
//
//
//var num: Int = 10
//var anotherNum: Int = 0
//func swapValue(_ a: inout Int , _ b: inout Int){
//    let temp = b
//    b = a
//    a = temp
//}
//print("num = \(num),anotherNum = \(anotherNum)")
//swap(&num, &anotherNum)
//print("num = \(num),anotherNum = \(anotherNum)")
//
//
////函数类型定义变量和常量
////函数类型 和 形式参数类型和返回类型相关，和形式参数名和实际参数标签无关。
//var mathFunction: (Int, Int) -> Int = addTwoNumber
//print(mathFunction(4,7))
//
////函数类型作为形式参数
//func printMathResult(_ mathFuntion:(Int ,Int) -> Int, a: Int, b: Int){
//    print("Result: \(mathFunction(a,b))")
//}
//printMathResult(mathFunction, a: 3, b: 0)
//
//
//
//
////没有返回值时，在返回类型位置加()或Void，若是输入输出参数，则需要加inout
////let swapfun:(inout Int,inout Int)-> () = swap
//let swapfun:(inout Int,inout Int)-> Void = swap
//print("swapfun num = \(num),anotherNum = \(anotherNum)")
//swapfun(&num,&anotherNum)
//print("num = \(num),anotherNum = \(anotherNum)")
//
////函数类型为返回类型
//func chooseStep(a: Int) -> (Int, Int) -> Int{
//    if a > 2 {
//        return addTwoNumber
//    }
//    return mathFunction
//}
//
//chooseStep(a: 3)
//chooseStep(a: 1)
//
//////内嵌函数（在函数的内部定义另外一个函数）
//func chooseStep1(a: Int) -> (Int, Int) -> Int{
//    func step1(a: Int,b: Int) -> Int{
//        return a + b
//    }
//    func step2(a: Int,b: Int) -> Int{
//           return a - b
//       }
//    if a > 2 {
//        return step1
//    }
//    return step2
//}
//
//print("step1 = \(chooseStep1(a: 3)(2,9)),step2 = \(chooseStep1(a: 1)(2,9))")
//
//
//
///********************************************闭包************************************************/
//let names = ["zhansan","lisi","wangwu"]
//let sortName = names.sorted()
//print(sortName)
//
//func backward(_ s1:String, _ s2: String ) -> Bool{
//    return s1 > s2
//}
//
////let sortedName1 = names.sorted(by: backward)
////
////print(sortedName1)
//
////let sortedName2 = names.sorted { (s1:String, s2: String) -> Bool in
////    s1 > s2
////}
//
//
////闭包自动推断类型，可省略 形式参数类型
//let sortedName2 = names.sorted { (s1, s2) -> Bool in
////    return s1 > s2
//
//
//    s1 > s2
//
//}
//print(sortedName2)
//
//
//let sortedName4 = names.sorted (by: > )
//print(sortedName4)
//
//
////尾随闭包
//let sortedName3 = names.sorted{$0 > $1}
//print(sortedName3)
//

//闭包捕获值
func makeIncrementer(amount: Int) -> () -> Int{
    var totoal = 0
    func incrementer() -> Int{
        totoal += amount
        return totoal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(amount: 10)
print("incrementByTen")
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())
let incrementBySeven = makeIncrementer(amount: 7)
print(incrementBySeven())
let incrementByTen1 = incrementByTen
print(incrementByTen1())





//逃逸闭包:@escaping   意味着必须在闭包里显示地引用self
var namess = ["zhangsan","lisi","wangwu"]
let customProvider = {namess.remove(at: 0)}
print(namess.count)
print(customProvider())
print(namess.count)

var providers:[()->String] = []
//@escaping  闭包在函数调用之后使用的需要用escaping
func collectCustomerProviders(provider:  @escaping () -> String){
    providers.append(provider)
}


//Cannot convert value of type 'String' to expected argument type '() -> String'
//collectCustomerProviders(provider: namess.remove(at: 0)) ❌
print("auto closure")
print(namess.count)

collectCustomerProviders(provider: { namess.remove(at: 0) }) //✅
print(namess.count)

for provide in providers{
    print(provide())
}
print(namess.count)

////✅
func collectCustomerProviders1(provider: @autoclosure  @escaping () -> String){
    providers.append(provider)
}
collectCustomerProviders1(provider: namess.remove(at: 0) )


class SomeClass{
    var x: String = "hello"
    func dosomething()  {
        collectCustomerProviders1(provider: self.x)
    }
}

//高阶函数
let numbers = [1,2,3,4,5]
print(numbers.map({$0 + 10}))
print(numbers.filter({$0 > 3}))
print(numbers.reduce(100) { $0 + $1})

let arrayNumbers = [[1,2,3],[4,5,6],[7,8,9]]
print(arrayNumbers.flatMap{ $0.map{$0 * 10} })


let nilNames:[String?] = ["zhangsan",nil,"li","wang"]
print(nilNames.compactMap{$0?.count})

//练习
let words = "I am a Happy Happy Happy girl"
let NON_WORDS = ["in","a","on"]
//命令式编程解法
func wordFrep(words: String) -> [String: Int]{
    var wordDict:[String: Int] = [:]
    let wordList = words.split(separator: " ")
    for word in wordList{
        let lowercaseword = word.lowercased()
        if !NON_WORDS.contains(lowercaseword){
            if let count = wordDict[lowercaseword] {
                wordDict[lowercaseword] = count + 1
            }
            else{
                wordDict[lowercaseword] = 1
            }
        }
    }
    return wordDict
}

print(wordFrep(words: words))

//函数式编程
func wordFrep2(words: String) -> [String: Int]{
    var wordDict: [String: Int] = [:]
    let wordList = words.split(separator: " ")
    wordList.map{$0.lowercased()}//尾随闭包
        .filter{!NON_WORDS.contains($0)}
        .forEach { wordDict[$0] = (wordDict[$0] ?? 0 ) + 1}
      return wordDict
}
print(wordFrep2(words: words))


let wordsArray = "Hello, World"
let wordArray: [Character] = ["W","a","e","i","o","u"]
func firstIndex() -> Int{
    var idx = -1
    zip(0..<wordsArray.count, wordsArray).forEach { (index, char) in
        if wordArray.contains(char) {
            idx = idx == -1 ? index : min(idx, index)
        }
    }
    
    return idx
}
print(firstIndex())


//练习
let employee = ["nail","s","stu","bob","aiden"]
func cleanName(names: [String]) -> String{
    var joinedNames = ""
    for name in names {
        if name.count > 1{
            joinedNames += name.capitalized + ","
        }
    }
    joinedNames.remove(at: joinedNames.index(before: joinedNames.endIndex))
    return joinedNames
}

print("练习")
print(cleanName(names: employee))

let result = employee.filter{$0.count > 1}
    .map{$0.capitalized}
.joined(separator: ",")
print(result)


extension Array where Element: Any{
    public func concurrentMap<T>(_ transform: (Element) -> T) -> [T]{
        let n = self.count
        if n == 0 {
            return[]
        }
        var result = Array<T>()
        result.reserveCapacity(n)
        DispatchQueue.concurrentPerform(iterations: n) { (i) in
            result.append(transform(self[i]))
        }
        return result
    }

}
let result2 = employee.filter{$0.count > 1}
    .concurrentMap{$0.capitalized}
.joined(separator: ",")
print(result2)
