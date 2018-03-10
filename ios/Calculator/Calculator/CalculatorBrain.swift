//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by cord7894 on 2017. 6. 30..
//  Copyright © 2017년 rhino. All rights reserved.
//

import Foundation

class CalculatorBrain {
    private var accumulator = 0.0
    
    func setOperand(operand:Double){
        accumulator = operand
    }
    
    private var operations:Dictionary<String,Operation> = [
        "π" : Operation.Constant(Double.pi),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnarayOperation(sqrt),
        "cos" : Operation.UnarayOperation(cos),
        "×" : Operation.BinarayOperation({$0 * $1}),
        "+" : Operation.BinarayOperation({$0 + $1}),
        "−" : Operation.BinarayOperation({$0 - $1}),
        "÷" : Operation.BinarayOperation({$0 / $1}),
        "=" : Operation.Equal
    ]
    
    private enum Operation {
        case Constant(Double)
        case UnarayOperation((Double)->Double)
        case BinarayOperation((Double,Double)->Double)
        case Equal
    }
    
    func performOperation(symbol:String) {
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let cons):
                accumulator = cons
            case .UnarayOperation(let function):
                accumulator = function(accumulator)
            case .BinarayOperation(let function):
                excutePendingBinarayOperation()
                pending = pendingBinarayOperation(binarayFunction: function, firstOperand: accumulator)
            case .Equal:
                excutePendingBinarayOperation()
            }
        }
    }
    
    private func excutePendingBinarayOperation() {
        if pending != nil{
            accumulator = pending!.binarayFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending :pendingBinarayOperation?
    
    private struct pendingBinarayOperation {
        var binarayFunction:(Double,Double)->Double
        var firstOperand:Double
    }
    
    var result:Double{
        get{
            return accumulator
        }
    }
}
