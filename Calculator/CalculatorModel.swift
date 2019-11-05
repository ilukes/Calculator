//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Lukes Lu on 2019/11/6.
//  Copyright © 2019 YunshenIT. All rights reserved.
//

import Foundation
import Combine

class CalculatorModel: ObservableObject {
    
    @Published var brain: CalculatorBrain = .left("0")
    
    @Published var history: [CalculatorButtonItem] = []
    
    
    func apply(_ item: CalculatorButtonItem) {
        self.brain = self.brain.apply(item: item)
        self.history.append(item)
        
        self.temporaryKept.removeAll()
        self.slidingIndex = Float(self.totalCount)
    }
    
    var historyDetail: String {
        self.history.map{"\($0)"}.joined()
    }
    
    var temporaryKept: [CalculatorButtonItem] = []
    
    var totalCount: Int {
        self.history.count + temporaryKept.count
    }
    
    var slidingIndex: Float = 0 {
        didSet {
            self.keephistory(upTo: Int(slidingIndex))
        }
    }
    
    func keephistory(upTo index: Int) {
        precondition(index <= totalCount, "Out of index.")
        
        let total = self.history + self.temporaryKept
        
        self.history = Array(total[..<index])
        self.temporaryKept = Array(total[index...])
        
        self.brain = self.history.reduce(CalculatorBrain.left("0"), { (result, item) in
            result.apply(item: item)
        })
    }
    
}
