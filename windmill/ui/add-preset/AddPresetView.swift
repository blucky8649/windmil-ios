//
//  AddPresetView.swift
//  windmill
//
//  Created by 이동연 on 12/1/23.
//

import SwiftUI

struct AddPresetView: View {
    @State private var presetName: String = ""
    @State private var interestRate: String = ""
    @State private var paymentWeekPeriod: String = ""
    @State private var weeklyIncrease: String = ""
    
    var body: some View {
        VStack() {
            EditPresetView(
                contents: $presetName,
                placeHolder: "프리셋 이름",
                fontSize: 12.0
            )
            EditPresetView(
                contents: $interestRate,
                placeHolder: "만기기준 금리(%)",
                fontSize: 12.0
            )
            EditPresetView(
                contents: $paymentWeekPeriod,
                placeHolder: "총 납부 기간(주)",
                fontSize: 12.0
            )
            EditPresetView(
                contents: $weeklyIncrease,
                placeHolder: "매주 증액량(원)",
                fontSize: 12.0
            )
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
        
    }
}

#Preview {
    AddPresetView()
}
