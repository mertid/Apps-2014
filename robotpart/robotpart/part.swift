//
//  part.swift
//  robotpart
//
//  Created by Merritt Tidwell on 9/4/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

import UIKit

protocol RobotThrusterDelegate {
    
    func explodes()
    func overHeated()
    func lowFuel() //warn parent that we're low on fuel
    func failure()
}

class RobotThruster: NSObject {
    
    //var fuelLevel = Int!
    var fuelLevel: Int = 0
    var fuelType: String = "Diesel"
    var temperature: Int = 0 //get robot temperature
    var rotation: Float = 0
    var emissionType: String = "Bubbles"
    
    var delegate:RobotThrusterDelegate?
    
    func addFuel(fuelAmount: Int) -> Bool {
        
        let maxFuel = 250
        
        fuelLevel += fuelAmount
        
        if fuelLevel > maxFuel {
            fuelLevel = maxFuel
        }
        
        return fuelLevel > maxFuel
    }
    
    
    func useFuel() {
        
        fuelLevel -= 10
        
        if fuelLevel < 50 {
            
            if(self.delegate != nil){
                self.delegate!.lowFuel()
            }
        }
        
        
    }
    
    func isOverHeated() -> Bool {
        
        let maxHeat = 5000
        
        return temperature >= maxHeat
    }
    
    
    
    func rotateThruster(rotationAmount: Float) {
        
        rotation += rotationAmount
    }
    
}

