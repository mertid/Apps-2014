// Playground - noun: a place where people can play

import UIKit

class Box : NSObject {
    
        var sides = 6
}

class Truck: NSObject {
    
    var contents: [Box]?
    var wheels : [Wheel] = []
    
    
}

class Wheel: NSObject {
    
    var type: Rubber?
    
}

class Rubber: NSObject {
    
    var color = UIColor.darkGrayColor()
}

// optional chaining

var truck: Truck?

truck = Truck()


truck?.wheels = [Wheel()]
truck?.contents = [Box()]

truck?.contents?[0].sides
truck?.wheels[0].type



class Request: NSObject {
    func makeRequestWithCompletion(completion: (Int,Int) -> Void) {
        // dispatch async -> gloabal
       //run http request
    
        //dispatch async ->
        
        
        completion(2,3)
    }

    func doNormalStuff() {
        makeRequestWithCompletion { (num1, num2) -> void in
            
    }
 



}








