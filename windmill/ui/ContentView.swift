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
                        DashboardView(currWeek: self.selectedWeek, totalWeeks: 26)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 5, trailing: 8))
                        
                        AccountsView()
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    }
                }.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        PresetView().padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 0))
                            
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
