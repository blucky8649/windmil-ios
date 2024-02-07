//
//  PresetListView.swift
//  windmill
//
//  Created by 이동연 on 2/6/24.
//

import SwiftUI

struct PresetListView: View {
    
    let cellDataList: [PresetListCell.Data]
    
    @State var maxHeight: CGFloat = 1000
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                RoundedRectangle(cornerRadius: 100)
                    .frame(width: 32, height: 4)
                    .foregroundColor(.outline)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                Text("Presets")
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                
                LazyVStack {
                    ScrollView {
                        ForEach(cellDataList, id: \.self) { cell in
                            PresetListCell(data: cell)
                        }
                    }.frame(width: geo.size.width, height: geo.size.height)
                }.frame(maxHeight: geo.size.width, alignment: .topLeading)
                    
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.mainContainer)
            
        }
        
        
    }
}

#Preview {
    VStack {
        let data:[PresetListCell.Data] = [
            PresetListCell.Data(presetName: "내맘대로 프리셋 1", totalWeeks: 26, currentWeek: 12, weeklyIncrease: 10000, paymentDay: .Friday, isActive: true),
            PresetListCell.Data(isActive: false),
            PresetListCell.Data(isActive: false)
        ]
        PresetListView(cellDataList: data)
    }
    
}
