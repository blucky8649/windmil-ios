//
//  ContentView.swift
//  windmill
//
//  Created by 이동연 on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("--DashboardView--")
            DashboardView()
            Spacer()
            Text("--AccountCell--")
            AccountCell()
            Spacer()
            Text("--WeeksSelectorView--")
            WeeksSelectorView()
        }
    }
}

#Preview {
    ContentView()
}
