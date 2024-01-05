# Closure 2

Repository related to the medium article about closures topic. 

## Description

This repository explains how closure syntax can evolve.

## Getting Started

SwiftUI project for XCode. Simply clone the repository. 

## Help

To see the difference in example closures, change the function as shown below and solve the errors with guidance of compiler if necessary.

```
    func getData() {
        downloadData2 { returnedData in
            text = returnedData
        }
    }
    
    to
    
    func getData() {
        downloadData3 { returnedData in
            text = returnedData
        }
    }
    
    and so on...
    
```

## Authors

[@merteyup](https://github.com/merteyup)
