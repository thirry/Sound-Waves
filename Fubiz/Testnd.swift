//
//  Testnd.swift
//  Fubiz
//
//  Created by Gone on 3/3/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class Testnd: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    let picker = UIDatePicker();
    
    let Pickers = UIPickerView();
    
    var myString = String()
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        label.text = myString
        
        createPicker()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func createPicker()
    {
        
        
        picker.datePickerMode = UIDatePickerMode.countDownTimer
        
        let fiveMin = TimeInterval(9 * 60)
        picker.countDownDuration = fiveMin
    
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePress))
        toolbar.setItems([doneButton], animated: false)
        
        textField.inputAccessoryView = toolbar
        textField.inputView = picker
        
    }
    
    
    @objc func donePress(){
        let dateFormat = DateFormatter()
      
//        dateFormat.timeStyle = .short
        dateFormat.dateStyle = .none
        dateFormat.timeStyle = .short
        
//        dateFormat.locale =
//        textField.text = "\(picker.date)"
        
        textField.text = dateFormat.string(from: picker.date)
        self.view.endEditing(true)
        
    }
}











































