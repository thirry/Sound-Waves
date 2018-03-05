//
//  Textrd.swift
//  Fubiz
//
//  Created by Gone on 3/3/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class Textrd: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textF: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func textEntered(_ sender: UITextField) {
        
        if sender.tag == 101 && sender.text?.characters.count == 2
        {
            (self.view.subviews.first(where: { $0.tag == 102 }) as! UITextField).becomeFirstResponder()
        }
        
        
    }
    
}
