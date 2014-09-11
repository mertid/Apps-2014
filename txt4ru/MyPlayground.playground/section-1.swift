// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var array1 : [String] = []

array1 += ["Hi"]

var array2 = array1

println(array1)
println(array2)

array2.append("Hola")
array2 += ["Hello"]

array1

println(array1)
println(array2)

var array3 = NSMutableArray()

array3.addObject("Hi")

var array4 = array3

array4.addObject("Hello")


