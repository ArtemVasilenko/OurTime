
import UIKit

class TimeViewController: UIViewController, DataDelegate {
    
    @IBOutlet var pickerTime: [UIPickerView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
        
        pickerTime.forEach {
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

extension TimeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0: return MyData.hour.count
        case 1: return MyData.minute.count
        case 2: return MyData.seconds.count
        default: return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0: return String(MyData.hour[row])
        case 1: return String(MyData.minute[row])
        case 2: return String(MyData.seconds[row])
        default: return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 && pickerTime.index(of: pickerView) == 0 {
            
            for i in 1..<3 {
                pickerTime[i].selectRow((row + i) % 24, inComponent: 0, animated: true)
            }
        }
    }
    
}

