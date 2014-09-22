//
//  ViewController.swift
//  FreeWithAd
//
//  Created by Merritt Tidwell on 9/22/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    self.canDisplayBannerAds = true
        
        
        var bannerView = ADBannerView(adType: ADAdType.MediumRectangle)
        bannerView.delegate = self
        self.view.addSubview(bannerView)
        
        var bannerView1 = ADBannerView()
        bannerView1.center = CGPointMake(bannerView1.center.x, UIScreen.mainScreen().bounds.size.height - (bannerView1.frame.size.height / 2.0 ))
        bannerView1.delegate = self
        self.view.addSubview(bannerView1)
        

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

