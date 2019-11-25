
/*
  Variables
 */
let const1 = 25
var vari1: Int = 16
var vari2 = 5.2
print(Double(vari1) + vari2)

var vari3: String = "Swift"
vari3.append("Practice")
var 🤪 = "iPhone"
var 😱 = "iPhone\u{301}"
var emojiRes = 🤪 == 😱

/*
  Arrays
 */
var intArr = [Int]()
var strArr = [String]()
strArr = ["me", "myslef", "I"]
strArr.append(contentsOf: ["String 4", "String 5"])
strArr.insert("Random", at: 1) // second element would be index 1
var mixedArr: [Any] = [12, "PewDiePie", true, 176.325, "J"]
mixedArr.remove(at: 2)

/*
  Loops
 */
var primeArr = [Int]()
for num in 1...100 {
    var count = 0
    for i in 1...num {
        if num % i == 0 {
            count += 1
        }
    }
    if count == 2 {
        primeArr.append(num)
    }
}
var sum = 0
for i in primeArr {
    print(i)
    sum += i
}
print("sum is \(sum)")
var index = 0
repeat {
    primeArr[index] += 2
    index += 1
} while index < primeArr.count
var strExample = "example"
var charArr = Array(strExample)
for (index, char) in charArr.enumerated() {
    print ("\(index) - \(char)")
}

/*
  Functions
 */
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}
func multiply(_ a: Float, _ b: Float) -> Float {
    return a * b
}
func maxThree(_ a: Int, _ b: Int, _ c: Int) -> Int {
    let tmp = a > b ? a : b
    return tmp > c ? tmp : c
}
add(1, 2)
multiply(1.2, 1.3)
maxThree(3, 6, 1)

/*
 Conditions
*/
func grade(_ score: Int) -> Character {
    switch score {
    case 0..<45: return "F"
    case 45..<60: return "C"
    case 60..<80: return "B"
    case 80..<101: return "A"
    default: return "N"
    }
}
grade(60)
func shape(_ length: Double, _ breadth: Double) {
    if (length.isEqual(to: breadth)) {
//    if (length - breadth < 1e-7) {
        print("Square")
    } else {
        print("Rectagle")
    }
}
shape(3.457878, 3.457878)

/*
  Dictionary and Tuples
 */
var userDic = [Int: String]()
userDic[1] = "Me"
userDic[2] = "Myself"
userDic[3] = "I"
for (key, value) in userDic {
    print ("Key: \(key), value: \(value)")
}
for key in userDic.keys {
    print (key)
}
userDic[2] = "Not me"
typealias MyTuple = (String, String)
var myTuple: MyTuple = ("Mon", "Tue")
print(myTuple.0)
print(myTuple.1)

/*
  Optionals
 */
let optvar: Int? = nil
let unwrappedme: String? = nil
if let unwrappedValue = unwrappedme {
    print(unwrappedValue)
} else {
    print("nil inside")
}
var pocketMoney: Optional<Double> = Double("50.6")
var value1: Int?
var defaultValue: Int = 8
if let tmp = value1 { // if..else..
    print(tmp)
} else {
    print(defaultValue)
}
print(value1 ?? defaultValue) // coalescing
class Helper { // helper
    var text: String?
    var address: String?
}
func guardTest() {
    var txtname = Helper()
//    txtname.address = "NU"
//    txtname.text = "COE"
    guard let name = txtname.text else {
        return
    }
    guard let address = txtname.address else {
        return
    }
    print("\(name) with \(address)")
}
guardTest()
