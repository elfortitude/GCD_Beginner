import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let queue = DispatchQueue(label: "myQueue.sources", attributes: .concurrent)

//      creating timer
let timer = DispatchSource.makeTimerSource(queue: queue)

//      setting timer
timer.schedule(deadline: .now(), repeating: .seconds(2), leeway: .milliseconds(300))
timer.setEventHandler {
    print("Hello, World!")
}

//      cancel block
timer.setCancelHandler {
    print("Timer is cancelled")
}

//      launching timer
timer.resume()
