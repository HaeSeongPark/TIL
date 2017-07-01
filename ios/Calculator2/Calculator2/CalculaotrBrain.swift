//
//  CalculaotrBrain.swift
//  Calculator2
//
//  Created by cord7894 on 2017. 7. 1..
//  Copyright © 2017년 rhino. All rights reserved.
//

import Foundation

class CalculaotrBrain {
    private var acumrator = 0.0
    
    func setOpend(input:Double) {
        acumrator = input
    }
    
    private var Operations:Dictionary<String,Operation> = [
        "π":Operation.Constant(M_PI),
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
    
    func performOperation(symbol:String){
        if let operation = Operations[symbol]{
            switch operation {
            case .Constant(let value):
                acumrator = value
            case .UnaryOperation(let function):
                acumrator = function(acumrator)
            case .BinaryOperation(let function):
                excutePendingBinaryOperation()
                pending = PendingBinarayOperation(funtion: function, firstOperand: acumrator)
            case .Equal:
                excutePendingBinaryOperation()
            }
        }
    }
    
    private func excutePendingBinaryOperation()
    {
        if pending != nil{
            acumrator = pending!.funtion(pending!.firstOperand,acumrator)
            pending = nil
        }
    }
    
    private var pending:PendingBinarayOperation?
    
    private struct PendingBinarayOperation {
        var funtion:(Double,Double)->Double
        var firstOperand:Double
    }
    
    
    var result:Double{
        get{
            return acumrator
        }
    }
}
