//
//  FubizBntHome.swift
//  Fubiz
//
//  Created by Gone on 1/24/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class FubizBntHome: UIButtonX {
    
    var audioPlayer = AVAudioPlayer()
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        //
        //        UIView.animate(withDuration: 0.3, animations: {
        //
        //            if self.transform == .identity{
        //                self.transform = CGAffineTransform(rotationAngle: 45 * (.pi / 45 ))
        //                //                self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        //
        //            } else {
        //                self.transform = CGAffineTransform(rotationAngle: 45 * (.pi / 45 ))
        //                self.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        //            }
        //        })
        //        return super.beginTracking(touch, with: event)
        //    }
        //
        //    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        //
        //    }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "slide", ofType: "mp3")!))
            
            audioPlayer.play()
        }
        catch{
            print(error)
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            
            if self.transform == .identity{
                self.transform = CGAffineTransform(rotationAngle: 45 * (.pi / 45 ))
                //                self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                
            } else {
                self.transform = CGAffineTransform(rotationAngle: 45 * (.pi / 45 ))
                self.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
                //self.transform = .identity
            }
        })
        
        return super.beginTracking(touch, with: event)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
    }
    
}
