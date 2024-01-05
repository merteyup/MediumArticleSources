//
//  ContentView.swift
//  Closures2
//
//  Created by Eyüp Mert on 1.01.2024.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello Eyup"
    
    func getData() {
        downloadData2 { returnedData in
            text = returnedData
        }
    }
    
    func downloadData() -> String {
        return "Changed text"
    }
    
    // Try this function to see non-escaping closure in action.
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("Changed text 2")
    }
    
    // Try this function to see @escaping closure in action.
    func downloadData3(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("Changed text 3")
        }
    }
    
    // Try this function to see @escaping closure in action with cleared syntax
    func downloadData4(completionHandler: @escaping (DownloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "Changed text 4", data2: "Changed text 4")
            completionHandler(result)
        }
    }
    
    // Try this function to see @escaping closure in action, cleared syntax with typealias.
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "Changed text 5", data2: "Changed text 5")
            completionHandler(result)
        }
    }
    
}
typealias DownloadCompletion = (DownloadResult) -> Void

struct DownloadResult {
    let data: String
    let data2: String
}

struct ContentView: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    ContentView()
}
