//
//  UISliderX.swift
//  004 - Calculator (Tip)
//
//  Created by Mark Moeykens on 1/13/17.
//  Copyright © 2017 Mark Moeykens. All rights reserved.
//

import UIKit

@IBDesignable
class UISliderX: UISlider {

    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var thumbHighlightedImage: UIImage? {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        setThumbImage(#imageLiteral(resourceName: "Slider"), for: .normal)
        
        if let highlighted = thumbHighlightedImage {
            setThumbImage(#imageLiteral(resourceName: "Slider"), for: .highlighted)
        } else {
            setThumbImage(#imageLiteral(resourceName: "Slider"), for: .highlighted)
        }
    }
}
