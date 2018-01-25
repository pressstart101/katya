//
//  ViewController.swift
//  katya
//
//  Created by walter scott on 1/24/18.
//  Copyright © 2018 mk. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var price_label: UILabel!
    @IBOutlet weak var price_text: UITextField!
    @IBOutlet weak var tip_label: UILabel!
    @IBOutlet weak var tip_picker: UIPickerView!
    @IBOutlet weak var total_label: UILabel!
    @IBOutlet weak var total_result: UILabel!
    @IBOutlet weak var print_button: UIButton!
    
    let tip_values = ["10","15","20","25"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tip_picker.delegate = self
        tip_picker.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tip_values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tip_values[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent  component: Int) {
        let valueSelected = tip_values[row] as String
        print(valueSelected)
        if let valueSelected_int = Float(valueSelected){
            if let price_text_int = Float(price_text.text!){
                print((price_text_int/100) * valueSelected_int)
                //                let value_total = String((price_text_int/100) * valueSelected_int)
                //                total_result.text = String.localizedStringWithFormat("%.2f", value_total)
                total_result.text = String(format: "%.2f", ((price_text_int/100) * valueSelected_int))
            }
        }
        
        
    }
    
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //
    //        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
    //        let compSepByCharInSet = string.components(separatedBy: aSet)
    //        let numberFiltered = compSepByCharInSet.joined(separator: "")
    //        return string == numberFiltered
    //    }
    
    
}
