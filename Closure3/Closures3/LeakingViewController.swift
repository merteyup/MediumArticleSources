//
//  LeakingViewController.swift
//  Closures3
//
//  Created by Eyüp Mert on 1.01.2024.
//

import UIKit

class LeakingViewController: UIViewController {
    
    // MARK: - Variables
    var timer: Timer!
    var counter = 0
    
    // MARK: - Actions
    @IBAction func startTimer(_ sender: UIButton) {
        print("Counter started")
        timerWithMemoryLeak()
    }
    
#warning("Here we use timer with closure. This closure, can outlive the context which it is living and also using a variable `counter`. That's why it has a strong reference. This connection causes retain cycle and memory leak.")
    func timerWithMemoryLeak() {
        timer = Timer.scheduledTimer(withTimeInterval: 1,
                                     repeats: true, block: { timer in
            self.counter += 1
            print("Counter: \(self.counter)")
        })
    }
    
    
#warning("In here, we are using [weak self]. So we are telling the compiler basically make this reference weak, and deallocate this timer if needed. After that self becomes an optional. But we can handle this with a guard statement. And prevent the memory leak.")
    func timerWithoutMemoryLeak() {
        timer = Timer.scheduledTimer(withTimeInterval: 1,
                                     repeats: true, block: { [weak self] timer in
            guard let strongSelf = self else { return }
            strongSelf.counter += 1
            print("Counter in action: \(strongSelf.counter)")
        })
    }
     
    
    // MARK: - Actions
    @IBAction func toMainViewController(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        if let window = UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }).first?.keyWindow {
            window.rootViewController = vc
            UIView.transition(with: window, duration: 0.3, animations: nil)
        } else {
            
        }
    }
    
    // MARK: - Statements
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
