//
//  CalculatorBrain.swift
//  Calculator3
//
//  Created by cord7894 on 2017. 7. 1..
//  Copyright © 2017년 rhino. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    private var accumulator = 0.0
    private var accumulatorIsInputed = false
    
    var description:String = "0.0"
    
    private var resultIsPending:Bool{
        get{
            return pending != nil
        }
    }
    
    func sender(input:Double){
        accumulator = input
        accumulatorIsInputed = true
        description = String(input)
    }

    private var operations:Dictionary<String,Operation> = [
        "π":Operation.Constant(M_PI),
        "e":Operation.Constant(M_E),
        "√":Operation.UnaryOperation(sqrt, {"√\($0)"}),
        "cos":Operation.UnaryOperation(cos, {"cos\($0)"}),
        "tan":Operation.UnaryOperation(tan, {"tan\($0)"}),
        "sin":Operation.UnaryOperation(sin, {"sin\($0)"}),
        "±":Operation.UnaryOperation({-$0}, {"-(\($0))"}),
        "+":Operation.BinarayOperation({$0+$1}, {"\($0) + \($1)"}),
        "−":Operation.BinarayOperation({$0-$1}, {"\($0) - \($1)"}),
        "×":Operation.BinarayOperation({$0*$1}, {"\($0) x \($1)"}),
        "÷":Operation.BinarayOperation({$0/$1}, {"\($0) / \($1)"}),
        "=":Operation.Equal,
        "C":Operation.Clear
    ]
    
    private enum Operation{
        case Constant(Double)
        case UnaryOperation((Double)->Double, (String)->String)
        case BinarayOperation((Double,Double)->Double, (String,String)->String)
        case Equal
        case Clear
    }
    
    func peroformOperation(symbol:String)
    {
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let valueDouble):
                accumulator = valueDouble
                description = symbol
            case .UnaryOperation(let funtion, let descriptionFunc):
                accumulator = funtion(accumulator)
                description = descriptionFunc(description)
            case .BinarayOperation(let function, let descriptionFunc):
                excuteBinaryOperation()
                pending = pendingBinaryOperation(function: function, firstOperand: accumulator, descriptionFunc: descriptionFunc, firstdecription: description)
                accumulatorIsInputed = false
            case .Equal:
                excuteBinaryOperation()
            case .Clear:
                accumulator = 0
                pending = nil
                description = "0.0"
            }
        }
    }

    private func excuteBinaryOperation(){
        if accumulatorIsInputed {
            if let copypending = pending{
                accumulator = copypending.function(copypending.firstOperand,accumulator)
                description = copypending.descriptionFunc(copypending.firstdecription,description)
                pending = nil
            }
        }
        
    }
    
    private var pending:pendingBinaryOperation?
    
    private struct pendingBinaryOperation {
        let function:(Double,Double)->Double
        let firstOperand:Double
        let descriptionFunc:(String,String)->String
        let firstdecription:String
    }
    
    var result:Double{
        get{
            return accumulator
        }
    }
    
    func getDescription() -> String {
        return resultIsPending ? (description + "...") : description
    }
}
