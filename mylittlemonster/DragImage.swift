//
//  DragImage.swift
//  mylittlemonster
//
//  Created by David Groomes on 2/17/16.
//  Copyright © 2016 Whistle. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView {
    
    var orginalPosition: CGPoint!
    var dropTarget: UIView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func   touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        orginalPosition = self.center
    }
    
    override func   touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first, let target = dropTarget {
            let postion = touch.locationInView(self.superview)
            
            if CGRectContainsPoint(target.frame, postion) {
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onTargetDropped", object: nil))
            }
        }
        
        
        
        self.center = orginalPosition
    }
}