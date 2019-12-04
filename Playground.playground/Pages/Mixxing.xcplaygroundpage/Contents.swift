//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


//#####################################Swift运行时#####################################
//                       原始定义      扩展
//值类型                  直接派发      直接派发
//协议                    函数表派发    直接派发
//类                     函数表派发      直接派发
//继承自NSObject 的类     函数表派发       消息机制派发


//修饰符
//final                  直接派发
//dynamic                消息机制派发
//@objc & @nonobjc       改变在OC里的可见性
//inline                 告诉编译器可以直接派发
//final & @objc  调用函数的时候会使用直接派发，但会在Objective-C的运行时里注册相应的selector。函数可以相应perform(selector)



//#####################################OC、Swift相互调用#####################################
//NS_SWIFT_NAME 在Objcetive-C中，重新命名在swift中的名称。Swift中则不能调用重命名前的名称
//NS_SWIFT_UNAVALIABLE  ，在Swift中不可见，不能使用。




//#####################################混编问题#####################################
//1.子类：对于自定义的类，OC的类不能继承自Swift的类。需要混编的Swift类可以继承自Oc的类
//2.宏：=> Swift中转化为 let ,var, func。Swift中只允许一些特别简单的宏，如#define KWIDTH 2
//3.swfit独有特性：元组，一等公民函数，特殊类型枚举，oc中都用不了
//4.NS_REFIND_FOR_SWIFT ：  Objective-C 的API和Swift的风格相差比较大，Swift调用Objective-C的API时可能由于数据类型等不一致导致无法到达预期（比如，OC里的方法采用了C语言风格的多参数类型；或者OC方法返回NSNotFound,在Swift中期望返回nil）。这时就要NS_REFIND_FOR_SWIFT。
//-(NSUInteger)indexOfString:(NSString *)aString NS_REFIND_FOR_SWIFT;
//<==>
//extension MyClass{
//func indexOfString(aString:String) -> Int?{
//    let index = Int(__index(of:aString))
//    if(index == NSNotFound){
//        return nil
//    }
//    return index
//}
//}
