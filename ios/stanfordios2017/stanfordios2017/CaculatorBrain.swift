//
//  CaculatorBrain.swift
//  stanfordios2017
//
//  Created by cord7894 on 2017. 6. 29..
//  Copyright © 2017년 rhino. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    private var accumulator = 0.0
    
    private var opertaions:Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnarayOperation(sqrt),
        "cos" : Operation.UnarayOperation(cos),
        "×" : Operation.BinarayOperation({$0 * $1}),
        "+" : Operation.BinarayOperation({$0 + $1}),
        "−" : Operation.BinarayOperation({$0 - $1}),
        "÷" : Operation.BinarayOperation({$0 / $1}),
        "=" : Operation.Equals
    ]
    
    private enum Operation{
        case Constant(Double)
        case UnarayOperation((Double)->Double)
        case BinarayOperation((Double,Double)->Double)
        case Equals
    }
    
    
    func performOperation(symbol:String) {
        if let operation = opertaions[symbol]{
            switch operation {
            case .Constant(let cons):
                accumulator = cons
            case .UnarayOperation(let function):
                accumulator = function(accumulator)
            case .BinarayOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOpertionInfo(binarayFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binarayFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending : PendingBinaryOpertionInfo?
    
    private struct PendingBinaryOpertionInfo {
        var binarayFunction : (Double,Double) -> Double
        var firstOperand : Double
    }
    
    func setOperand(operand:Double){
        accumulator = operand
    }
    
    var result:Double{
        get{
            return accumulator
        }
    }
}
