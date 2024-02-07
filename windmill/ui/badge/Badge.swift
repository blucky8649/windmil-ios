//
//  Badge.swift
//  windmill
//
//  Created by 이동연 on 2/6/24.
//

import SwiftUI

struct Badge: View {
    let backgroundColor: Color
    let fontColor: Color
    let fontSize: Int
    let text: String
    
    
    var body: some View {
        VStack {
            Text(text)
                .padding(EdgeInsets(top: 3, leading: CGFloat(fontSize / 2), bottom: 3, trailing: CGFloat(fontSize / 2)))
                .font(.system(size: CGFloat(fontSize), weight: .medium))
                .foregroundColor(fontColor)
        }
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 100))
        
    }
}

#Preview {
    VStack {
        Badge(backgroundColor: .secondary95, fontColor: .mainFixed, fontSize: 20, text: "26 weeks total")
        
    }
    
}
