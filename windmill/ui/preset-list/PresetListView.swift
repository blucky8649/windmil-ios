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
    @State private var isShowAddPreset = false
    @State private var selectedCellIndex: Int? = nil
    @State private var isNavigationActive: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                VStack {
                    HStack {
                        Text("Presets")
                            .font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                        Spacer()
                        Button {
                            selectedCellIndex = nil
                            isNavigationActive = true
                        } label: {
                            Text("추가")
                                .foregroundStyle(Color.main)
                                .font(.system(size: 14))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                        }
                    }.padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                    
                    
                    LazyVStack {
                        ScrollView {
                            ForEach(cellDataList.indices, id: \.self) { cell in
                                let preset = cellDataList[cell]
                                Button {
                                    isNavigationActive = preset.isActive
                                    selectedCellIndex = cell
                                } label: {
                                    PresetListCell(data: preset)
                                }
                            }
                            .navigationDestination(isPresented: $isNavigationActive) {
                                if let index = selectedCellIndex {
                                    let preset = cellDataList[index]
                                    AddPresetView(presetName: preset.presetName, paymentWeekPeriod: String(preset.totalWeeks), weeklyIncrease: String(preset.weeklyIncrease))
                                } else {
                                    AddPresetView()
                                }
                            }

                        }.frame(width: geo.size.width, height: geo.size.height)
                    }.frame(maxHeight: geo.size.width, alignment: .topLeading)
                        
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .background(Color.surface)
                
            }.onAppear {
                ContentView.coloredAppearance.backgroundColor = UIColor(Color.surface)
            }
            
            
            
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

