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
    @IBOutlet weak var artist_label: UILabel!
    @IBOutlet weak var artist_name: UITextField!
    @IBOutlet weak var done_button: UIButton!
    
    
    let tip_values = ["10","15","20","25"]
    var valueSelected = String()
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
        valueSelected = tip_values[row] as String
        print(valueSelected)
        if let valueSelected_int = Float(valueSelected){
            if let price_text_int = Float(price_text.text!){
                print((price_text_int/100) * valueSelected_int)
                total_result.text = String(format: "%.2f", ((price_text_int/100) * valueSelected_int) + price_text_int)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destVC: ReceiptViewController = segue.destination as! ReceiptViewController
//        destVC.string = valueSelected
        if let price_wrap = price_text.text{
            destVC.price = price_wrap
            print(price_wrap)
        }
        destVC.tip = valueSelected
        destVC.total = total_result.text!
        destVC.artist = artist_name.text!
//        print(price_text.text)
//        print(valueSelected)
//        print(total_result.text)
//        print(artist_name.text)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destViewController : ReceiptViewController = segue.destination as! ReceiptViewController
//        
////        if areEqualImages(img1: UIImage(named: "profilePic.png")!, img2: picToSave.image!){
////            print("blah")
////        }else{
////            destViewController.thePic = picToSave.image!
////
////        }
//        
//        
//        //destViewController.thePic = picToSave.image!
//        destViewController.price = "blah"
////        destViewController.price = price_text.text!
////        destViewController.tip = valueSelected
////        destViewController.total = total_result.text!
////        destViewController.artist = artist_name.text!
//    }
    
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //
    //        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
    //        let compSepByCharInSet = string.components(separatedBy: aSet)
    //        let numberFiltered = compSepByCharInSet.joined(separator: "")
    //        return string == numberFiltered
    //    }
    
    
}
