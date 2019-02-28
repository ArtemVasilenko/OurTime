

import Foundation


protocol DataDelegate {
    func createData()
}

struct MyData {
    static var hour = [Int]()
    static var minute = [Int]()
    static var seconds = [Int]()
}

extension DataDelegate {
    
    func createData() {
        
        for i in 0..<24 {
        MyData.hour.append(i)
        }
        
        for i in 0..<60{
        MyData.minute.append(i)
        MyData.seconds.append(i)
        }
        
    }
    
}
