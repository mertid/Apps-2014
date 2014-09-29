//
//  ViewController.swift
//  Scrolls
//
//  Created by Merritt Tidwell on 9/29/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

     var imageView = UIImageView(image: UIImage(named: "ss"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    
        var scrollView = UIScrollView(frame:self.view.frame)
        
        self.view.addSubview(scrollView)
        
        scrollView.contentSize = CGSizeMake(640, 568)
        
 
        for i in 0...1 {
            
            var subScrollView = UIScrollView(frame: self.view.frame)
            
            subScrollView.frame.origin.x = CGFloat(320 * i)
            
            subScrollView.contentSize = CGSizeMake(320, 1136)
            subScrollView.pagingEnabled = true
            scrollView.addSubview(subScrollView)
            
            for i in 0...1 {
                
                
                var y = CGFloat(568 * i)
             
                
                var blueBox = UIView(frame: CGRectMake( 0, y, 320 , 568))
        
                
                blueBox.backgroundColor = UIColor(white: CGFloat (arc4random_uniform(100)) / 100.0, alpha: 1.0)
                        
                scrollView.addSubview(blueBox)
            
                subScrollView.addSubview(blueBox)

            }
        }
        
        
        
        // scrollView.pagingEnabled = true
        
//        scrollView.maximumZoomScale = 2.0
//        
//        scrollView.zoomScale = 2.0
//        
//        scrollView.delegate = self
//        

        
        
        //        for i in 0...9 {
//            
//
    
    func    viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
            
                return imageView
        }
        
    
    
    }


}

