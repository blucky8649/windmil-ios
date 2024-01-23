//
//  DashboardView.swift
//  windmill
//
//  Created by 이동연 on 1/1/24.
//

import SwiftUI

struct DashboardView: View {
    var currWeek: Int
    var totalWeeks: Int
    
    var body: some View {
        VStack {
            Text("\(currWeek)주차 납부 금액")
                .font(.system(size: 10, weight: .regular))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundColor(.secondary)
            Text("16,592,192원")
                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundColor(.onSurface)
          
            WindmillProgressView(weekValue: WeekValue(total: totalWeeks, week: currWeek), height: 10)
            
        }
        .frame(alignment: .leading)
        .padding(20)
        .background(Color.onSecondary)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .withShadow(type: .elevation2)
    }
}

#Preview {
    DashboardView(currWeek: 5, totalWeeks: 26)
}
