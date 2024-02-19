//
//  ContentView.swift
//  windmill
//
//  Created by 이동연 on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    static let coloredAppearance = UINavigationBarAppearance()
    @State var selectedWeek = 12
    @State var preset: Preset = createPreset(presetName: "Windmil", totalWeeks: 26, weeklyIncrease: 5000, targetWeek: 26)
    @State var isPresetTitleClicked = false
    
    init() {
        ContentView.coloredAppearance.backgroundColor = UIColor(Color.mainContainer)
        UINavigationBar.appearance().scrollEdgeAppearance = ContentView.coloredAppearance
        
        ContentView.coloredAppearance.shadowColor = .clear
      
    }
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    WeeksListView(totalWeeks: 26, selectedWeek: $selectedWeek) { clickedWeek in
                        print(clickedWeek)
                        selectedWeek = clickedWeek
                    }
                    VStack {
                        let weeklyData = preset.weeklyData[selectedWeek-1]
                        DashboardView(currWeek: self.selectedWeek, totalWeeks: 26, totalAmount: weeklyData.amountAcc)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 5, trailing: 8))
                        
                        AccountsView(accounts: weeklyData.accountsAcc)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    }
                }.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        PresetView(presetName: preset.name).padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 0))
                            .onTapGesture {
                                isPresetTitleClicked.toggle()
                            }
                            .sheet(isPresented: $isPresetTitleClicked) {
                                let data:[PresetListCell.Data] = [
                                    PresetListCell.Data(presetName: "내맘대로 프리셋 1", totalWeeks: 26, currentWeek: 12, weeklyIncrease: 10000, paymentDay: .Friday, isActive: true),
                                    PresetListCell.Data(isActive: false),
                                    PresetListCell.Data(isActive: false)
                                ]
                                PresetListView(cellDataList: data)
                                    .presentationCornerRadius(28) // TODO: IOS 16.4
                                    .presentationDragIndicator(Visibility.visible)
                            }
                    }
                }.background(Color.onMain)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .background(VStack(spacing: .zero) { Color.mainContainer ; Color.onMain })
        }.animation(nil)
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
