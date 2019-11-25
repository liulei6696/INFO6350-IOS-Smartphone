
// classes
class Animal {
    var name: String
    var age: Int
    var weight: Double
    
    init(name: String, age: Int, weight: Double) {
        self.name = name
        self.age = age
        self.weight = weight
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 0, weight: 0.0)
    }
}
class Dog: Animal { }
let dog = Dog(name: "Tracy")
var ani1 = Animal(name: "ani1")
var ani2: Animal = ani1
ani1.name = "anini"
print("ani1: \(ani1.name)")
print("ani2: \(ani2.name)")

// Enum
enum Signal: String {
    case g = "green"
    case r = "red"
    case y = "yellow"
}
func takeAction(signal: Signal) {
    switch signal {
    case .g: print("GO")
    case .r: print("Stop")
    case .y: print("Slow down")
    }
}
let signal = Signal.r
takeAction(signal: signal)

// structure
struct Rectangle {
    var length:  Double
    var width: Double
    var edgeLength: Double {
        return 2 * (length + width)
    }
}
var rec1 = Rectangle(length: 1.0, width: 1.0)
var rec2 = rec1
rec1.length = 2.0
print("edge length of rec1: \(rec1.edgeLength)")
print("edge length of rec2: \(rec2.edgeLength)")

// protocols
protocol Vehicle {
    func brand()
    func color()
}
class Car: Vehicle {
    func brand(){
        print("Tesla")
    }
    func color() {
        print("black")
    }
}

// extensions
extension Rectangle {
    func area() -> Double{
        return length * width
    }
}
let rec = Rectangle(length: 3.0, width: 5.0)
print("extended function, area: \(rec.area())")

// subscripts
struct CircleAreaCalculator {
    let π = 3.14 // rough value
    subscript(radius: Double) -> Double {
        return π * radius * radius
    }
}
let calCircleArea = CircleAreaCalculator()
print("The area of a circle with radius of 2 is: \(calCircleArea[2])")
