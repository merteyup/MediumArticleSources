# Closure 3

Repository related to the medium article about closures topic. 

## Description

This repository explains how closures can causes retain cycles and memory leaks. Also shares a solution to this problem.

## Getting Started

Project with storyboard for XCode. Simply clone the repository. 

## Help

To see the difference in example closures, change the function as shown below and solve the errors with guidance of compiler if necessary.
To understand how retain cycle is happening:

### Observing the problem: 

```
    @IBAction func startTimer(_ sender: UIButton) {
        print("Counter started")
            timerWithMemoryLeak()
    }
```
- Use `timerWithMemoryLeak()` as shown above.
- Go to LeakingViewController with pressing button.
- Call `timerWithMemoryLeak()` function in `startTimer()` action.
- Observe print statements with incrementing count.
- Go back to main viewController with button.
- Repeat this process 3 times. 
- Observe print statements. You'll start to see new timer instances as a proof of memory leak.


### Resolving the problem: 

```
    @IBAction func startTimer(_ sender: UIButton) {
        print("Counter started")
            timerWithoutMemoryLeak()
    }
```
- Use `timerWithoutMemoryLeak()` instead of `timerWithMemoryLeak()` as shown above.
- Go to LeakingViewController with pressing button.
- Call `timerWithoutMemoryLeak()` function in `startTimer()` action.
- Observe print statements with incrementing count.
- Go back to main viewController with button.
- Observe print statements. You'll see print statements will stop at the moment you change the view controller. 


## Authors

[@merteyup](https://github.com/merteyup)
