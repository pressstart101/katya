//
//  ReceiptViewController.swift
//  katya
//
//  Created by walter scott on 1/26/18.
//  Copyright © 2018 mk. All rights reserved.
//

import UIKit

class ReceiptViewController: UIViewController {
//    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var price_print: UILabel!
    @IBOutlet weak var tip_print: UILabel!
    @IBOutlet weak var total_print: UILabel!
    @IBOutlet weak var artist_print: UILabel!
    @IBOutlet weak var print_button: UIButton!
    
    
    var price = String()
    var tip = String()
    var total = String()
    var artist = String()
    var imageCaptured = UIImage()
    
    
//    var string: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
//        label.text = string
        // Do any additional setup after loading the view.
        setupReceipt()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupReceipt() {
        price_print.text = price
        tip_print.text = tip
        total_print.text = total
        artist_print.text = artist
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func print_button(_ sender: Any) {
//        // 1
//        let printController = UIPrintInteractionController.shared
//        // 2
//        let printInfo = UIPrintInfo(dictionary:nil)
//        printInfo.outputType = UIPrintInfoOutputType.general
//        printInfo.jobName = "print Job"
//        printController.printInfo = printInfo
//
//        // 3
//        let formatter = UIMarkupTextPrintFormatter(markupText: "total_result.text!")
//        formatter.perPageContentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
//        printController.printFormatter = formatter
//
//        // 4
//        printController.present(animated: true, completionHandler: nil)
        
        captureScreen()
        
//        if UIPrintInteractionController.canPrint(imageCaptured) {
            let printInfo = UIPrintInfo(dictionary: nil)
            printInfo.jobName = "imageCaptured"
            printInfo.outputType = .photo
            
            let printController = UIPrintInteractionController.shared
            printController.printInfo = printInfo
            printController.showsNumberOfCopies = false
            
            printController.printingItem = imageCaptured
            
            printController.present(animated: true)
//        }
    }
    
    func captureScreen() {
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 375, height: 490), false, 0);
        self.view.drawHierarchy(in: CGRect(x: 0, y: -65, width: view.bounds.size.width,height: view.bounds.size.height), afterScreenUpdates: true)
        imageCaptured = UIGraphicsGetImageFromCurrentImageContext()!;
//        UIImageWriteToSavedPhotosAlbum(imageCaptured, nil, nil, nil)
        UIGraphicsEndImageContext()
        
    }

}
