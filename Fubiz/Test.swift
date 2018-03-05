//
//  Test.swift
//  Fubiz
//
//  Created by Gone on 3/3/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class Test: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    
    @IBOutlet weak var labels: UILabel!
    @IBOutlet weak var pickerViews: UIPickerView!
    
    let numbers = ["one", "two", "three", "8", "9", "32", "11"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numbers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labels.text = numbers[row]
        textField.text = numbers[row]
    }
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func Save(_ sender: Any) {
        
        if textField.text != ""
        {
            performSegue(withIdentifier: "seque", sender: self)
        }
        
    }
    
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?)
    {
        //        let secondManager = seque.destination as! Testnd
        //         secondManager.myString = textField.text!
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            let secondManager = seque.destination as! Testnd
            secondManager.myString = numbers[row]
            
        }
        
        
        //        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
        //            secondManager.myString = textField.text!
        //
        ////           secondManager.myString = numbers[row]
        //        }
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}



























