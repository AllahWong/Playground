//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
///********************************************OOP************************************************/
//枚举
enum CompassPoint : CaseIterable{
    case south
    case north
    case east
    case west
}

let direction = CompassPoint.west
switch  direction {
    case .south:
    print("south")
    case .north:
        print("north")
    case .east:
        print("east")
    case .west:
        print("west")

}

print(CompassPoint.allCases) //CaseIterable

enum controlCharacter: String{
    case tab = "\t"
    case line = "\n"
}

print(controlCharacter.tab.rawValue) //.tab 打印tab, .rawValue打印制表符


enum CompassPointInt : Int{
    case south = 5
    case north
    case east
    case west
}

//let directionInt = CompassPointInt(rawValue: 8)//Optional(__lldb_expr_17.CompassPointInt.west)
let directionInt = CompassPointInt(rawValue: 9)//nil

print(directionInt)

//枚举的关联值
enum Barcode{
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}

let productCode = Barcode.upc(12, 3, 4, 5)
print(productCode)

switch productCode {
case .upc(let a, let b, let c , let d):
    print("upc-\(a),\(b),\(c),\(d)")
case .qrCode(let qr):
    print("arcCode - \(qr)")
}


//递归枚举
indirect enum ArithmeticExpression{
    case number(Int)
    case add(ArithmeticExpression,ArithmeticExpression)
    case multiply(ArithmeticExpression,ArithmeticExpression)
}


let firstExpression = ArithmeticExpression.number(5)
let secondExpression = ArithmeticExpression.number(4)
let addExpression = ArithmeticExpression.add(firstExpression, secondExpression)
let thirdExpression = ArithmeticExpression.number(2)
let mutiplyExpression = ArithmeticExpression.multiply(addExpression, thirdExpression)
print(mutiplyExpression)


func eval(expression: ArithmeticExpression) -> Int{
    switch expression {
    case .number(let a):
        return a
        case .add(let expression1, let expression2  ):
        return eval(expression: expression1) + eval(expression: expression2)
        case .multiply(let expression1, let expression2):
        return eval(expression: expression1) * eval(expression: expression2)
        
    }
}


print(eval(expression: mutiplyExpression))
//: [Next](@next)

//为类、结构体、枚举添加属性
struct Point{
    var x: Int = 0
    var y = 0 //有类型推断，可以不用指定类型
}

struct size{
    var width = 0
    var height = 0
}

struct Rect{
    var origin: Point
    var size: size
    var Center:Point{
        get{
            return Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2) //单个表达式可省略return 。需要用Xcode 11编译
        }
        set(newCenter){//省略newCenter->set ,则默认为newValue
            origin.x = newCenter.x - size.width / 2
            origin.y = newCenter.y - size.height / 2
        }
//        set{
//            origin.x = newValue.x - size.width / 2
//                       origin.y = newValue.y - size.height / 2
//        }
    }
}


class StepCounter{
    var totalStep: Int = 0{
        willSet(newSteps){ //不指定参数名称newSteps => willSet{}  ，则默认为newValue
            print("will set total steps to \(newSteps)")
        }
        didSet(oldSteps){ //不指定参数名称oldSteps  ，则默认为oldValue
            print("did change total steps from \(oldSteps) to \(totalStep)")
        }
    }
}

var counter = StepCounter()
counter.totalStep = 100
counter.totalStep = 360
counter.totalStep = 812


//全局变量也支持属性观察
var count: Int = 0{
    willSet{
        print("will set count to \(newValue)")
    }
    didSet{
        print("did change count from \(oldValue)")
    }
}

count = 10


//为类、结构体、枚举添加方法
struct Point2{
    var x = 0
    var y = 0
    func printInfo()  {
        print("x is\(x),y is \(y)")
    }
    static func printTypeInfo() {
        print("A Point")
    }
    
    
    //枚举同结构体，如此
    mutating func moveBy(x: Int, y: Int)  {
        self.x += x
        self.y += y
    }
}

var p = Point2(x: 2, y: 2)  //如果结构体中没有定义任何自定义的初始化器，会自动生成一个成员初始化器
p.printInfo()
p.moveBy(x: 3, y: 3)
p.printInfo()

Point2.printTypeInfo()

//为类、结构体、枚举提供下标访问 下标不能提供默认值   类型下标-》Xcode 11
struct Matrix{
    let rows: Int //常量，在初始化器结束之前赋值就可以。赋值过一次就不能再赋值
    let columns: Int
    var grid:[Double]
    init(rows: Int , columns: Int) {
        //如果方法的形式参数名和属性名重名,形式参数名优先，则使用self访问属性，不重名不需要
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    subscript(row: Int ,column: Int) -> Double{
        get{
            return grid[row * columns + column]
        }
        set{
            grid[row * columns + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[1,0] = 9.9
matrix[0,1] = 8.9
print(matrix.grid)
print(matrix[0,1])

//类型下标 Xcode 11
enum CompassPoint2: Int{
    case south
    case north
    case east
    case west
    
    static subscript(index: Int) -> CompassPoint2{
        get{
            return CompassPoint2(rawValue: index)!
        }
    }
}

let direction2 = CompassPoint2[2]
print("direction \(direction2)")

//类的初始化和反初始化  。结构体和枚举不涉及继承，初始化和反初始化比较简单
//初始化器可以调用其它初始化器来执行部分实例的初始化《==》初始化器委托
//便携初始化器 convenience

//类的继承和初始化
class Person{
    var name: String
    var age: Int
    
    //必要初始化器,子类必须重写 初始化器中需要初始化所有的存储属性
    required init(name: String) {
        self.name = name
        self.age = 30
    }
    
    
    init(name: String , age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(){
        self.init(name:"[unnamed]",age: 18)
    }
    
    convenience init(age: Int){
           self.init(name:"[unnamed]",age: age)
       }
}

class Teacher: Person{
    var salary: Int
    
    
    //重载/重写父类的初始化器，会继承父类的便携初始化器
    override init(name: String, age: Int) {
        self.salary = 5000
        super.init(name: name, age: age)
    }
    
    init(name: String, age: Int, salary: Int) {
        self.salary = salary

        super.init(name: name, age: age)
        self.test() //方法调用中的self 必须在super.init之后

        self.name = name
           self.age = age
    }
    
    func test() {
        print("Teacher test")
    }
    
    convenience init(salary: Int) {
        self.init(name:"Zhangsan",age: 9,salary:salary) //便携初始化器只有在调用init后才能使用self
        self.salary = salary

    }
    
    required init(name: String) {
        self.salary = 30
        super.init(name: name)
        self.name = name
    }
    
}

let teacher = Teacher(age: 3)
teacher.test()

class Person1{
var name: String
var age: Int

    //可失败初始化器
    init?(name: String, age: Int) {
        if age > 20 {
            return nil
        }
        self.name = name
        self.age = age
    }

}

let person2 = Person1(name: "LISI", age: 40)
print("p\(person2)")

//在Swift类中实现继承
class Vehicle{
    var currentSpeed: Int = 0
    var desc: String{
        return "run at speed \(currentSpeed)"
    }
    
    func makeNoise()  {
        
    }
}

class Car: Vehicle{
    var gear: Int = 0
    override var desc: String{
        return super.desc + "at gear \(gear)"
    }
}

var car = Car()
car.gear = 3
car.currentSpeed = 30
print(car.desc)
