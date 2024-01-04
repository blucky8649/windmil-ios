//
//  WeeksSelectorView.swift
//  windmill
//
//  Created by 이동연 on 12/27/23.
//

import SwiftUI

struct WeeksSelectorView: View {
    
    @State var isSelected = false
    var index = 1
    
    var body: some View {
        VStack {
            Text("\(index)")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(getFontColor())
            Text("Weeks")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(getFontColor())
        }
        .frame(width: 64, height: 90)
        .background(getBackGroundColor())
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .withShadow(isSelected: isSelected)
    }
    
    func getFontColor() -> Color {
        return isSelected ? .white : .purpleDefault
    }
    
    func getBackGroundColor() -> Color {
        return isSelected ? .purpleDefault : .white
    }
}

extension View {
    func withShadow(isSelected: Bool) -> some View {
        return isSelected ? self.shadow(radius: 0) : self.shadow(radius: 5, x: 3, y: 3)
    }
    
}



#Preview {
    WeeksSelectorView(isSelected: true, index: 12)
}
