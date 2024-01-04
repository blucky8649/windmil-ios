//
//  DashboardView.swift
//  windmill
//
//  Created by 이동연 on 1/1/24.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack {
            Text("9주차 납부 금액")
                .font(.system(size: 10, weight: .regular))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundColor(.RightGray65)
            Text("16,592,192원")
                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundColor(.black)
            WindmillProgressView(value: 26, total: 26)
            
        }
        .frame(alignment: .leading)
        .padding(20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .shadow(radius: 5, x: 3, y: 3) // drop shadow
    }
}

#Preview {
    DashboardView()
}
