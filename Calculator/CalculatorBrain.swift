//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Lukes Lu on 2019/8/26.
//  Copyright © 2019 YunshenIT. All rights reserved.
//

import Foundation

enum CalculatorBrain {
    
    case left(String)
    case leftOp(left: String, op: CalculatorButtonItem.Op)
    case leftOpRight(left: String, op: CalculatorButtonItem.Op, right: String)
    case error
    
}
