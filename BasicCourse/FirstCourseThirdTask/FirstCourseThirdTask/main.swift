import Foundation
import FirstCourseThirdTaskChecker

let checker = Checker()

public struct Stack: ArrayInitializable, StorageProtocol {
    public init(array: [Int]) {
        elements = array
    }
    public  init() {
        elements = [Int]()
    
    }
    public mutating func push(_ element: Int) {
        elements.append(element)
    }
    public mutating func pop() -> Int {
        return elements.popLast()!
    }
    
    private var elements: [Int]
    
    public var count: Int {
        get {
            return elements.count
        }
    }
}

public struct Queue: ArrayInitializable, StorageProtocol {
    public init(array: [Int]) {
        elements = array
    }
    public init() {
        elements = [Int]()
    }
    public mutating func push(_ element: Int) {
        elements.append(element)
    }
    public mutating func pop() -> Int {
        let last = elements.first!
        elements.remove(at: 0)
        return last
    }
    
    private var elements: [Int]
    
    public var count: Int {
        get {
            return elements.count
        }
    }
}

var myStack = Stack()
var myQueue = Queue()
checker.checkProtocols(stack: myStack, queue: myQueue)
extension User: JSONSerializable  {
    public func toJSON() -> String {
        return "{\"fullName\": \"\(fullName)\", \"email\": \"\(email)\"}"
    }
    
    
}
extension User: JSONInitializable {
    public convenience init(JSON: String) {
        self.init()
        var strings = JSON.components(separatedBy: " ")
        self.fullName = strings[1]
        var i = 2
        while (!strings[i].contains("email")) {
            self.fullName += String(" ")
            self.fullName += strings[i]
            i += 1
        }
        i += 1
        self.fullName.removeLast()
        self.fullName.removeLast()
        self.fullName.removeFirst()
       
    
        self.email = strings[i]
        self.email.removeLast()
        self.email.removeLast()
        self.email.removeFirst()
        //Yes, last lines of code are not perfect, but assuming task it is ok
        
    }
}

checker.checkExtensions(userType: User.self)

