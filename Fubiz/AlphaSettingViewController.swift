//
//  AlphaSettingViewController.swift
//  Fubiz
//
//  Created by Gone on 3/5/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class AlphaSettingViewController: UIViewController {
    
    let picker = UIDatePicker()
    
    var times:Int = 0
    @IBOutlet weak var tv_countdowns: UITextView!
    var countdown_push = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPicker()
        
        if countdown_push != ""{
            tv_countdowns.text = String(times) + " min"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createPicker()
    {
        
        picker.datePickerMode = UIDatePickerMode.countDownTimer
        //        let fiveMin = TimeInterval(9 * 60)
        //        picker.countDownDuration = fiveMin
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePress))
        toolbar.setItems([doneButton], animated: false)
        
        //        textField.inputAccessoryView = toolbar
        //        textField.inputView = picker
        
        tv_countdowns.inputAccessoryView = toolbar
        tv_countdowns.inputView = picker
        
        
    }
    
    @objc func donePress(){
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeStyle = .short
        dateFormatter.dateFormat = "HH:mm:ss"
        
        //        dateFormat.locale =
        //        textField.text = "\(picker.date)"
        //        textField.text = dateFormatter.string(from: picker.date)
        
        self.view.endEditing(true)
        
        //        labelnd.text = dateFormatter.string(from: picker.date)
        
        let calendar = Calendar.current
        
        let minutes = calendar.component(.minute, from: picker.date)
        let hours = calendar.component(.hour, from: picker.date)
        
        //        let seconds = calendar.component(.second, from: picker.date)
        //                labelnd.text = String(hours*60*60)
        //                label_nd.text = String(minutes*60)
        //                label_rd.text = String(seconds)
        
        times = hours*60 + minutes
        tv_countdowns.text = String(times) + " min"
       
    }
    
    @IBAction func Back(_ sender: Any) {
        if tv_countdowns.text != ""{
            performSegue(withIdentifier: "seq_setting_to_alpha", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondCtr = segue.destination as! AlphaWavesViewController
        secondCtr.selectedSecs = times
    }
}




















