//: [Previous](@previous)

import Foundation
import PlaygroundSupport

var str = "Hello, playground"

///********************************************线程************************************************/

//Thread
//不希望代码在主线程结束后就退出
PlaygroundPage.current.needsIndefiniteExecution = true

for i in 0..<10{
    Thread.detachNewThread {
        print(i)
    }
}

class ObjectThread{
    func threadTest() {
        let thread = Thread(target: self, selector: #selector(threadWorker), object: nil)
        thread.start()
    }
    
    @objc func threadWorker() {
        print("threadWorker")
    }
}

let obj = ObjectThread()
obj.threadTest()



//Operation
class ObjectOperation{
    func test() {
//        let operation = BlockOperation{ [weak self] in
//            self?.threadWorker()
//        }
        
        let operation = MyOperation()
        operation.completionBlock = {()->Void in
            print("CompletionBlock")
        }
        let queue = OperationQueue()
        queue.addOperation(operation)
    }
    
    @objc func threadWorker() {
        sleep(1)
        print("threadWorker")
    }
}


class MyOperation: Operation{
    override func main() {
        sleep(1)
        print("in MyOperation main")
    }
}

let objO = ObjectOperation()
objO.test()
print("after invoker test")

// GCD




//: [Next](@next)
