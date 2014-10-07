// Playground - noun: a place where people can play

import UIKit

extension UIColor {

    class func peachColor() -> UIColor {
    
        
    return UIColor(red: 1.0, green: 0.8, blue: 0.44, alpha: 1.0)
        
    }


}

UIColor.greenColor()
UIColor.peachColor()

private var kName = "nameKey"


//how to use setter and getters within an extension

extension UIView {
    
    
//    var viewName: String {
//        get {
//            return objc_getAssociatedObject(self, &kName) as String
//        }
//        set {
//            objc_setAssociatedObject(self, &kName, newValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
  
    var area: CGFloat {return frame.size.height * frame.size.width}


}

var shape = UIView()





var box = UIView(frame: CGRectMake(0, 0, 25, 40))

box.area

var box2 = UIView(frame: CGRectMake(0, 0, 100, 30))
box2.area


extension String {
    
    func broIt() -> String {
        return self + ", Bro"
        
    }

    func howManyofThisLetter(letter: String) -> Int {
        var letterCount = 0
    
        for c in self.startIndex..<self.endIndex
        
        {
            let range = Range<String.Index>(start: c, end: advance(c, 1))
            let character = self.substringWithRange(range)
            if character == letter {
                letterCount++
            }
            
                }
        return letterCount
        }
        
    }




"Sup".broIt()
"Want to get lunch".broIt()

"Atlanta".howManyofThisLetter("a")

var button = UIButtonItem()
button.customView













