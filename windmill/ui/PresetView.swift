//
//  PresetView.swift
//  windmill
//
//  Created by 이동연 on 1/19/24.
//

import SwiftUI

struct PresetView: View {
    var body: some View {
        HStack() {
            Text("Preset 1").font(.system(size: 14, weight: Font.Weight.medium))
                .foregroundColor(.onMainContainer)
                .frame(alignment: .leading)
                .padding(-9)
            Image(.arrowDropDown)
                .renderingMode(.template)
                .foregroundColor(.onMainContainer)
        }
    }
}

#Preview {
    VStack {
        PresetView()
    }
    
}
