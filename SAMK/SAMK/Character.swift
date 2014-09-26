//
//  Character.swift
//  SAMK
//
//  Created by Merritt Tidwell on 9/22/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit
import SpriteKit
let FIRE_CONTACT: UInt32 = 1
let PLAYER_CONTACT: UInt32 = 2
let MAX_HP: Int = 100


class Character: NSObject {
   
    var body: SKSpriteNode!
    var direction: CGFloat = 1.0 // right
    
    var textureNames: [String] = []
    var currentHP: Int = 0
    
    init(animal:String) {
        
        var characterAtlas = SKTextureAtlas(named: animal)
        textureNames = sorted(characterAtlas.textureNames as [String],<)
        
        body = SKSpriteNode(imageNamed: characterAtlas.textureNames[0] as String)
        
        body.size = CGSizeMake(40 , 80)
       
        
        
     //   body.fillColor = UIColor.whiteColor()
        body.physicsBody = SKPhysicsBody(rectangleOfSize: body.frame.size)
   
    
        body.physicsBody?.allowsRotation = false
       // body.physicsBody?.categoryBitMask = FIRE_CONTACT

    }
    
    //
//        if bodyB.node == self {
//    
//            currentHP -= 10
//            bodyA.node?.removeFromParent()
//            
//        }
    
    
    func moveLeft(){
        direction = -1
        body.physicsBody?.applyImpulse(CGVectorMake(-40.0, 0.0))
      
        var walkAction = SKAction.animateWithTextures(texturesFromNames(), timePerFrame: 0.1, resize: false, restore: true)
        
        body.runAction(walkAction)
        
        body.xScale = direction
    }
    
    func moveRight(){
        
        direction = 1
      body.physicsBody?.applyImpulse(CGVectorMake(40.0, 0.0))
    
        var walkAction = SKAction.animateWithTextures(texturesFromNames(), timePerFrame: 0.1, resize: false, restore: true)
        
        body.runAction(walkAction)
        
        body.xScale = direction
        

        
        
        
    }


    func jump(){
        
        
        body.physicsBody?.applyImpulse(CGVectorMake(0.0, 50.0))
    }

    func fire(){
    
        var kamehamedha = SKSpriteNode(rectOfSize: CGSizeMake(50,50), cornerRadius: 50)
       // kamehamedha.fillColor = UIColor.cyanColor()
        kamehamedha.position = CGPointMake(body.position.x + 50 * direction, body.position.y)
        
        
        kamehamedha = SKSpriteNode(imageNamed: "500px-Fireball_NSMB")

        
        kamehamedha.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        kamehamedha.physicsBody?.affectedByGravity = false
       
        //scene.addChild(kamehamedha)
        
        body.parent?.addChild(kamehamedha)
        kamehamedha.physicsBody?.applyImpulse(CGVectorMake(10.0 * direction, 0.0))
        
        
        body.physicsBody?.applyImpulse(CGVectorMake(-20.0 * direction, 0.0))
        

        kamehamedha.physicsBody?.contactTestBitMask = FIRE_CONTACT
        
    }

    func texturesFromNames() -> [SKTexture] {
        var textures : [SKTexture] = []
        for textureName in textureNames {
            textures.append(SKTexture(imageNamed: textureName))
        
        }
        return textures
    }
    
}





