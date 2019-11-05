//
//  HistoryView.swift
//  Calculator
//
//  Created by Lukes Lu on 2019/11/6.
//  Copyright © 2019 YunshenIT. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var model: CalculatorModel
    
    var body: some View {
        VStack {
            if self.model.totalCount == 0 {
                Text("没有履历")
            }else{
                HStack {
                    Text("履历")
                        .font(.headline)
                    Text("\(self.model.historyDetail)").lineLimit(nil)
                }
                HStack {
                    Text("显示").font(.headline)
                    Text("\(self.model.brain.output)")
                }
                
                Slider(value: self.$model.slidingIndex, in: 0...Float(self.model.totalCount), step: 1.0)
            }
        }
        .padding()
    }
}
