//
//  AccountCell.swift
//  windmill
//
//  Created by 이동연 on 12/18/23.
//

import SwiftUI

struct AccountCell: View {
    private var index = 0
    private var amount = 0
    
    private var intValue: Int = 1000000
    
    init(index: Int = 0, amount: Int = 0) {
        self.index = index
        self.amount = amount
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Text("\(index)")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.purpleDefault)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            Text("\(amount) 원")
                .font(.system(size: 16, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 64)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding(10)
        .shadow(radius: 5, x: 3, y: 3) // drop shadow
    }
}

#Preview {
    AccountCell(index: 2_212_234_230, amount: 10_000_000)
}

extension Int {
    func toDate() -> String? {
        return nil
    }
    func formatterStyle(_ numberStyle: NumberFormatter.Style) -> String? {
        let numberFommater: NumberFormatter = NumberFormatter()
        numberFommater.numberStyle = numberStyle
        return numberFommater.string(for: self)
    }
}
