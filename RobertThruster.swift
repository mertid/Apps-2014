//
//  RobertThruster.swift
//  
//
//  Created by Merritt Tidwell on 9/4/14.
//
//

import UIKit

class RobertThruster: NSObject {//
    //  RobotRocket.swift
    //
    //
    //  Created by Merritt Tidwell on 9/4/14.
    //
    //
    
    import UIKit
    
    protocol RobotRocketDelegate {
        
        func explodes()
        func overheated()
        func lowFuel()
        func failure()
        
        
        
        
    }
    
    
    
    class RobotRocket: NSObject {
        
        var fuelLevel : int = 0
        
        var fuelType : String = "Diesel"
        
        var temperature : Int = 0 // get robot temperature
        
        var rotation : Float = 0
        
        var emissionType: String = "Bubbles"
        
        
        func addFuel(fuelAmount : int) -> Bool {
            
            let maxFuel = 250
            
            fuelLevel += fuelAmount
            
            if fuelLevel > maxFuel {
                
                fuelLevel = maxFuel
            }
            
            
            return fuelLevel >+ maxFuel
        }
        
        
        func  isOverHeated() -> Bool {
            
            let maxHeat = 5000
            
            return temperature >= maxHeat
            
        }
        
        
        func rotateThruster(rotationAmount : Float) {
            
            rotation += rotationAmount
            
        }
        
    }
   
}
