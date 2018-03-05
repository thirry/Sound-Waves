//
//  ViewController.swift
//  Fubiz
//
//  Created by Gone on 1/24/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var CircleWaves: UIView!
    @IBOutlet weak var FubizWaves: FubizBntHome!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CircleWaves.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        
        UIView.animate(withDuration: 3, delay: 0.0, options: [.curveEaseOut, .autoreverse],
                       animations: { () -> Void in
                        
//                        let anim = CABasicAnimation(keyPath: "position.x")
//                        anim.fromValue = 0
//                        anim.toValue = 10.0
//                        anim.duration = 1.0
//                        self.FubizWaves.layer.add(anim, forKey: nil)
                        
                        //view property animation
                        self.FubizWaves.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                            .concatenating(CGAffineTransform(translationX: 1.0, y: 0.0))
            
        }, completion: nil)

    }
    
    @IBAction func FubizTapped(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, animations: {
            if self.CircleWaves.transform == .identity{
                self.CircleWaves.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            }else{
                self.CircleWaves.transform = .identity
            }
        })
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Alpha(_ sender: Any) {
        performSegue(withIdentifier: "move", sender: self)
    }
    
}




















