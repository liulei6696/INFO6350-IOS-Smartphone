//
//  StartButton.swift
//  SmartProfile Nib
//
//  Created by Lei on 10/26/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import UIKit

@IBDesignable class StandardButton: UIButton {

    @IBInspectable var borderCorner: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = borderCorner
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    

}
