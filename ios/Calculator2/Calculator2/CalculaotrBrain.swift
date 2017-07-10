//
//  CalculaotrBrain.swift
//  Calculator2
//
//  Created by cord7894 on 2017. 7. 1..
//  Copyright © 2017년 rhino. All rights reserved.
//

import Foundation

struct CalculaotrBrain {
    private var accumulator:Double?
    
    mutating func setOpend(input:Double) {
        accumulator = input
    }
    
    private var Operations:Dictionary<String,Operation> = [
        "π":Operation.Constant(.pi),
        "e":Operation.Constant(M_E),
        "cos":Operation.UnaryOperation(cos),
        "√":Operation.UnaryOperation(sqrt),
        "+":Operation.BinaryOperation({$0+$1}),
        "−":Operation.BinaryOperation({$0-$1}),
        "×":Operation.BinaryOperation({$0*$1}),
        "÷":Operation.BinaryOperation({$0/$1}),
        "=":Operation.Equal
    ]
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation((Double,Double)->Double)
        case Equal
    }
    
    mutating func performOperation(symbol:String){
        if let operation = Operations[symbol]{
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .BinaryOperation(let function):
                if accumulator != nil {
                    excutePendingBinaryOperation()
                    pending = PendingBinarayOperation(funtion: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .Equal:
                excutePendingBinaryOperation()
            }
        }
    }
    
    private mutating func excutePendingBinaryOperation()
    {
        if pending != nil && accumulator != nil{
            accumulator = pending!.funtion(pending!.firstOperand,accumulator!)
            pending = nil
        }
    }
    
    private var pending:PendingBinarayOperation?
    
    private struct PendingBinarayOperation {
        var funtion:(Double,Double)->Double
        var firstOperand:Double
    }
    
    
    var result:Double?{
        get{
            return accumulator
        }
    }
}
