import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let workItem = DispatchWorkItem(qos: .utility, flags: .detached) {
    print("Performing workItem")
}

//workItem.perform()

let queue = DispatchQueue(label: "myQueue", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem, target: DispatchQueue.global(qos: .userInitiated))

queue.asyncAfter(deadline: .now() + 1, execute: workItem)

workItem.notify(queue: .main) {
    print("workItem is competed!")
}

workItem.isCancelled
workItem.cancel()
workItem.isCancelled

workItem.wait()

print("We have waited!")
