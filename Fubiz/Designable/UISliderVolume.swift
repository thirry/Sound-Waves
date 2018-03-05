//
//  UISliderVolume.swift
//  Fubiz
//
//  Created by Gone on 1/31/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

@IBDesignable
class UISliderVolume: UISlider {

    @IBInspectable var thumbImage: UIImage? {
        didSet {
           setThumbImage(thumbImage, for: .normal)
        }
    }
    
    @IBInspectable var thumbHighlightedImage: UIImage? {
        didSet {
            setThumbImage(thumbHighlightedImage, for: .highlighted)
        }
    }
    
}
