//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
///********************************************OOP 2************************************************/

//多态和类型转换
class MediaItem{
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem{
    var director: String
    init(name: String, director:String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem{
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
    
}

let aray = [Movie(name: "1", director: "m"),Song(name: "2", artist: "p")]
print(type(of: aray))//Array<MediaItem>

for item in aray{
    if let realItem = item as? Movie { //as?进行向下类型转换后，可以访问director
        print(realItem.director)
    }
}


let aray2 = [Movie(name: "1", director: "m"),Movie(name: "2", director: "p")]
print(type(of: aray2))//Array<Movie>


//扩展应用
extension Double{
    var km: Double{
        return self / 1000.0
    }
}

let speed: Double = 1200.0
print(speed.km)

extension Int{
    func repeatTask(task:()->()) {
        for _ in 0..<self{
            task()
        }
    }
}

3.repeatTask {
    print("hello")
}

extension Int{
    subscript(digitIndex: Int) -> Int{
        get{
            var base = 1
            for _ in 0..<digitIndex{
                base *= 10
            }
            return self / base % 10
        }
    }
}


print(908[2])

extension Int{
    enum  kind {
        case zero
        case negative
        case positive
    }
    
    var kind: kind{
        get{
            switch self{
            case 0:
                    return .zero
            case let x where x > 0:
                    return .positive
            default:
                return .negative
            }
        }
    }
}


print(765.kind)

//: [Next](@next)
