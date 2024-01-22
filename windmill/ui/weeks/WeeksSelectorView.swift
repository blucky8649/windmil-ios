//
//  WeeksSelectorView.swift
//  windmill
//
//  Created by 이동연 on 12/27/23.
//

import SwiftUI

struct WeeksSelectorView: View {
    
    @Binding var isSelected: Bool
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
        .withShadow(type: .elevation2)
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
    }
    
    func getFontColor() -> Color {
        return isSelected ? .onMain : .main
    }
    
    func getBackGroundColor() -> Color {
        return isSelected ? .main : .onMain
    }
}


#Preview {
    VStack {
        @State var isSelectecd = false
        WeeksSelectorView(isSelected: $isSelectecd, index: 12)
    }
    
}
