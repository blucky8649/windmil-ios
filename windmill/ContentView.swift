//
//  ContentView.swift
//  windmill
//
//  Created by 이동연 on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
            }.navigationTitle("Windmill")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("Settings") {}
                    }
                    
                }
        }
    }
}

#Preview {
    ContentView()
}
