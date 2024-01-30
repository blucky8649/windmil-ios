//
//  AccountsView.swift
//  windmill
//
//  Created by 이동연 on 1/21/24.
//

import SwiftUI

struct AccountsView: View {
    var accounts: [Int]
    
    var body: some View {
        VStack {
            Text("Bank Accounts")
                .font(.system(size: 16, weight: Font.Weight.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            LazyVStack {
                ForEach(0 ..< accounts.count, id: \.self) {index in
                    AccountCell(index: index + 1, amount: accounts.reversed()[index])
                }
                
            }
        }
    }
}

#Preview {
    ScrollView(.vertical) {
        @State var accounts = [1, 2, 3, 4, 5, 6]
        AccountsView(accounts: accounts)
    }
}
