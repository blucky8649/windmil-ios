//
//  PresetListCell.swift
//  windmill
//
//  Created by 이동연 on 2/6/24.
//

import SwiftUI

struct PresetListCell: View {
    
    struct Data : Hashable {
        var presetName: String = ""
        var totalWeeks: Int = 0
        var currentWeek: Int = 0
        var weeklyIncrease: Int = 0
        var paymentDay: Day = .Monday
        var isActive: Bool = false
    }
    
    let data: Data
    
    private let viewHeight = CGFloat(90)
    
    var body: some View {
        HStack {
            if (!data.isActive || data.presetName.isEmpty || (data.totalWeeks + data.currentWeek + data.weeklyIncrease) == 0) {
                Image(.icLock)
                    .renderingMode(.template)
                    .foregroundColor(.outline)
                    .frame(maxWidth: .infinity)
                    
            } else {
                Image(.icMoney)
                    .renderingMode(.template)
                    .foregroundColor(.onSurface)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 5))
                    
                   
                VStack {
                    HStack {
                        Text(data.presetName).foregroundStyle(Color.onSurface)
                        Badge(backgroundColor: .mainFixed, fontColor: .white, fontSize: 8, text: "\(data.currentWeek) 주차")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        
                    HStack {
                        Badge(backgroundColor: .secondary95, fontColor: .mainFixed, fontSize: 12, text: "\(data.totalWeeks) weeks total")
                        Badge(backgroundColor: .secondary95, fontColor: .mainFixed, fontSize: 12, text: "₩ \(data.weeklyIncrease.toDecimal())")
                        Badge(backgroundColor: .secondary95, fontColor: .mainFixed, fontSize: 12, text: "\(data.paymentDay)")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .frame(height: viewHeight)
        .background(Color.onSecondary)
    }
}

#Preview {
    VStack {
        PresetListCell(
            data: PresetListCell.Data(presetName: "내맘대로 프리셋 1", totalWeeks: 26, currentWeek: 12, weeklyIncrease: 10000, paymentDay: .Monday, isActive: true)
        )
        PresetListCell(data: PresetListCell.Data(isActive: false))
        PresetListCell(data: PresetListCell.Data(isActive: false))
        
    }
    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    .background(Color.surface)
    
}
