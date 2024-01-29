//
//  AccountsView.swift
//  windmill
//
//  Created by 이동연 on 1/21/24.
//

import SwiftUI

struct AccountsView: View {
    var body: some View {
        VStack {
            Text("Bank Accounts")
                .font(.system(size: 16, weight: Font.Weight.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            LazyVStack {
                ForEach(1...15, id: \.self) {index in
                    AccountCell(index: index, amount: index * 10000)
                }
                
            }
        }
    }
}

#Preview {
    ScrollView(.vertical) {
        AccountsView()
    }
}
