//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//********************************变量和常量***************************
let maxNum = 0
//常量：OC:宏、const、readonly
//maxNum = 4 ❌//Cannot assign to value: 'maxNum' is a 'let' constant  ;Change 'let' to 'var' to make it mutable

//let c,a,b : String
//c = "a"  //✅
//c = "c" //❌Immutable value 'c' may only be initialized once


var var1,var2 :String
var1 = "3"//✅
var1 = "4"//✅
//var1 = 5  //❌Cannot assign value of type 'Int' to type 'String'


//变量和常量的名字几乎可以使用任何字符，甚至包括Unicode字符
//变量和常量的名字不能包含空白字符、数学符号、箭头、保留的（或无效的）UInicode码位、连线和制表符。不能以数字开头
let 你好 = "d"//✅
let 😢 = "ku"//✅
//let $ = "r"//❌
let `$` = "r"//✅
//let ∪ = "u"//❌




//: [Next](@next)
