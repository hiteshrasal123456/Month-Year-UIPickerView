//
//  ViewController.swift
//  MonthYearPicker
//
//  Created by Tejora on 07/08/19.
//  Copyright © 2019 Tejora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var monthYearPicker : MonthYearPickerView!
    @IBOutlet weak var txtMonthYear: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtMonthYear.delegate = self
        self.monthYearPicker = MonthYearPickerView()
        
        self.monthYearPicker.onDateSelected = { (month: Int, year: Int) in
            let string = String(format: "%02d%d", month, year)
            NSLog("date is \(string)") // should show something like 05/2015
        }
        // Do any additional setup after loading the view.
    }


}

extension ViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.inputView = self.monthYearPicker
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.monthYearPicker.onDateSelected = { (month: Int, year: Int) in
            let string = String(format: "%02d%d", month, year)
          //  NSLog("date is \(string)") // should show something like 05/2015
        }
    }
}
