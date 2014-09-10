//
//  Button.swift
//  🙉🙈🙊
//
//  Created by Merritt Tidwell on 9/9/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class Button: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

    override func layoutSubviews() {
        
        self.layer.cornerRadius = 8
        
        self.backgroundColor = UIColor.redColor()

    }
    
   

}
