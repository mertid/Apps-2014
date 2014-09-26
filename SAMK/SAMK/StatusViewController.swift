//
//  StatusViewController.swift
//  SAMK
//
//  Created by Merritt Tidwell on 9/22/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    
    var scene: GameScene!
    var player1HP = UIView()
    var player2HP = UIView()
    
    let timeLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.frame = CGRectMake(0,0, SCREEN_WIDTH,50)
      //  self.view.backgroundColor = UIColor.redColor()
        
        timeLabel.frame = CGRectMake(0, 20, 80, 40)
        timeLabel.center = CGPointMake(self.view.center.x, timeLabel.center.y)
        timeLabel.text = "00:00"
        timeLabel.textAlignment = .Center
        self.view.addSubview(timeLabel)
        
        player1HP.frame = CGRectMake(20, 20, (SCREEN_WIDTH - 160) / 2.0, 10)
        player1HP.backgroundColor = UIColor.greenColor()
        self.view.addSubview(player1HP)
        
        player2HP.frame = CGRectMake(SCREEN_WIDTH - (SCREEN_WIDTH - 160)/2.0 - 20, 20, (SCREEN_WIDTH - 160) / 2.0, 10)
        player2HP.backgroundColor = UIColor.greenColor()
        self.view.addSubview(player2HP)

        setHealthForPlayer(MAX_HP, player: 0)
        setHealthForPlayer(MAX_HP, player: 1)
        
        
   
    }

    
    
    
    func setHealthForPlayer(health: Int, player: Int)
    
    {
        
        let healthF = CGFloat(health)
        let maxF = CGFloat(MAX_HP)
        
        
        switch player {
        case 0:
            for view in player1HP.subviews as [UIView]{
                view.removeFromSuperview()
            }
            var lostHealth = UIView(frame: CGRectMake(0, 0, player1HP.frame.size.width - player1HP.frame.size.width / maxF * healthF, 10))
           
            
            lostHealth.backgroundColor = UIColor.redColor()
            player1HP.addSubview(lostHealth)
        
        default:
            
            for view in player2HP.subviews as [UIView] {
                view.removeFromSuperview()
            }
    
            var lostHealth2 = UIView(frame: CGRectMake(player2HP.frame.size.width / 100 * health, 0, player1HP.frame.size.width - player2HP.frame.size.width / maxF * healthF, 10))
            
            
            lostHealth2.backgroundColor = UIColor.redColor()
            player2HP.addSubview(lostHealth2)

                        
        }
    
    
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
