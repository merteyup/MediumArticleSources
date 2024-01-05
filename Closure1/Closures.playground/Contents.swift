import UIKit

struct ClosureWorker {
    let name: String
    let age: Int
    let imageName: String
}

func updateView(with: ClosureWorker) {
    // Finally we get our command into here. We can update our view.
    print("Step6: View updated")
}

/// Some kind of trigger, starts the process.
func getInfoPressed() {
    let workerService = ClosureWorkerService2()
    print("Step1: Update pressed")
    // We enter this function called fetchWorker.
    // Normally we expect this to happen line by line.
    // Like step4 and step 5 should be happen.
    // But because we are entering the closure, step 2 happens.
    workerService.fetchWorker(for: "Eyup") { (worker) in
        print("Step4: Closure worked")
        // Fetch worker has finished it's job.
        // Sent it's value with completion handler named worker.
        // Now we are able to update our view with that value.
        updateView(with: worker)
            /// If we use it with escaping closure, we need to add  `self.updateView()`, and tell the compiler explicitly.
    }
}

struct ClosureWorkerService {
    func fetchWorker(for city: String, completion: (ClosureWorker) -> Void) {
        print("Step2: Fetch started")
        // We came here from step 1 by passing rest of the function.
        // Until we finish our operations in here, step 4 won't be happening.
        // So update view won't be called.
        // So view won't be updating.
        // That's why UI can freeze, app can crash.
        // Request is going to the web, takes time, and returning it finally in completion block.
        // Non-escaping closures runs immediately. Like functions.
        // Means completion(worker) happens immediately.
        let worker = ClosureWorker(name: "Eyup",
                                     age: 21,
                                     imageName: "person")
        // We finish our works in this closure, and send our response with completion.
        print("Step3: Completion handler sent")
        completion(worker)
        print("Step5: Function returned")
    }
}

struct ClosureWorkerService2 {
    func fetchWorker(for name: String, completion: @escaping (ClosureWorker) -> Void) {
        print("Step2: Fetch worked")
        // If we do that operation in background thread as usual
        // Request is going to the web, takes time, and returning it finally in completion block.
        // Non-escaping closures runs immediately. Like functions.
        // Means completion(worker) normally happens immediately.
        // But as like here, as mostly in real life, they will be in background thread.
        // Or somehow they will be happening in the future.
        // When we add DispatchQueue, closure wants to escape.
        // It will happen somewhere in the future, and this should be explicitly expressed.
        
        
        // Escaping closure: Closure that runs after a method returns.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let worker = ClosureWorker(name: "Eyup",
                                         age: 21,
                                         imageName: "person")
         
            print("Step3: Completion handler sent")
            // Which means this is gonna executed beyond the scope of which it runs here.
            completion(worker)
        }
        print("Step5: Function returned")
    }
}

getInfoPressed()

