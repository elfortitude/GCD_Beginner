import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//      Define class with generic.
class SafeArray<Element> {
    private var array = [Element]()
    private let queue = DispatchQueue(label: "DispatchBarrier", attributes: .concurrent)
    
//      Using queue with barriers.
    public func append(element: Element) {
        queue.async(flags: .barrier) {
            self.array.append(element)
        }
    }

//      Computing property with sync queue.
    public var elements: [Element] {
        var result = [Element]()
        queue.sync {
            result = self.array
        }

        return result
    }
}

var safeArray = SafeArray<Int>()
DispatchQueue.concurrentPerform(iterations: 10) { (index) in
    safeArray.append(element: index)
}
print("safeArray: \(safeArray.elements)")

//var array = [Int]()
//DispatchQueue.concurrentPerform(iterations: 10) { (index) in
//    array.append(index)
//}
//print("array: \(array)")
