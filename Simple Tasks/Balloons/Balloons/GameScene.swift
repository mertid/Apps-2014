//
//  GameScene.swift
//  Balloons
//
//  Created by Merritt Tidwell on 8/21/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
   
    var centerPoint = CGPointMake(0,0)
    
    override func didMoveToView(view: SKView) {
      
        centerPoint = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame))
        
        self.physicsWorld.gravity = CGVector (0,-1.0)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
       
        
   
        for i in 0...1 {
            
            var spriteNode = SKSpriteNode(imageNamed: "balloon_gold")
            
            spriteNode.physicsBody = SKPhysicsBody(circleOfRadius:spriteNode.frame.size.width/2.0)
        
            var floatI = CGFloat(i)
            
             spriteNode.position = CGPointMake(self.frame.width/10.0 * floatI, 300.0)
            
            self.addChild(spriteNode)
        
            
            
        }
    
        
    
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            var dart = SKSpriteNode (imageNamed: "Dart")
            
            dart.physicsBody = SKPhysicsBody 
            
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
