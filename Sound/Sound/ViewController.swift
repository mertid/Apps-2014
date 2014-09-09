//
//  ViewController.swift
//  Sound
//
//  Created by Merritt Tidwell on 9/5/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController, AVCaptureAudioDataOutputSampleBufferDelegate {
                            
    
    var audioSession = AVAudioSession()
    var audioDataOutput = AVCaptureAudioDataOutput()
    var audioCaptureSession = AVCaptureSession()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        audioSession.setCategory(AVAudioSessionCategoryRecord, error: nil)
        audioSession.setMode(AVAudioSessionModeMeasurement, error: nil)
        audioSession.setActive(true, error:nil)
        audioSession.setPreferredSampleRate(48000, error: nil)
        
        var device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeAudio)
        
        var audioCaptureInput = AVCaptureDeviceInput(device: device, error:nil)
        
        audioCaptureSession.addInput(audioCaptureInput)
        
        audioDataOutput.setSampleBufferDelegate(self, queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, CUnsignedLong()))
        
        audioCaptureSession.addOutput(audioDataOutput)
        
        audioCaptureSession.startRunning()


    
    }

    // only blow bubbles if peak or power passes a number
    
    // after animation finishes remove bubble from the screen
    
    // find a cool image that can be a bubble, lightnig bolt, fire.
    
    
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!) {
        
        println("output")
    
        for channel: AnyObject in connection.audioChannels {
        
        println("peak hold \(channel.peakHoldLevel) and average power \(channel.averagePowerLevel)")
            
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
           
                self.createBubble()
        
            })
        }
    
    }
    
    let height = UIScreen.mainScreen().bounds.size.height
    let width = UIScreen.mainScreen().bounds.size.width
    
    
    func createBubble()
    {
        var bubble = UIView(frame: CGRectMake(0, 0, 20, 20))
        bubble.center = CGPointMake(width / 2, height)
        bubble.backgroundColor = UIColor.blueColor()
        bubble.layer.cornerRadius = 10
        
        self.view.addSubview(bubble)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            let x = CGFloat(arc4random_uniform(UInt32(self.width)))
            let y = CGFloat(arc4random_uniform(UInt32(self.height)))
            
            bubble.center = CGPointMake(x, y)
        })
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

