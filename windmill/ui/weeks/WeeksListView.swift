//
//  WeeksListView.swift
//  windmill
//
//  Created by 이동연 on 1/20/24.
//

import SwiftUI

struct WeeksListView: View {
    
    var totalWeeks: Int = 26
    @Binding var selectedWeek: Int
    var onClick: (Int) -> () = {_ in }
    @State private var scrollPosition: Int? = 0
    
    var body: some View {
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators: false) {
                @State var isWeekSelected: (Int) -> (Bool) = { curr in
                    selectedWeek == curr
                }
                LazyHStack(alignment: .top, spacing: 10) {
                    
                    ForEach(1...totalWeeks, id: \.self) {index in
                        @State var isSelected = true
                        WeeksSelectorView(isSelected: Binding<Bool>(get: {index == selectedWeek}, set: {_ in selectedWeek = index}), index: index)
                            .onTapGesture {
                                NSLog("selected Week \(selectedWeek)")
                                isSelected = !isSelected
                                onClick(index)
                            }
                        
                    }
                }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            }
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            .background(Color.mainContainer)
            .onAppear {
                value.scrollTo(selectedWeek, anchor: .center)
            }
        }
        

    }
}

#Preview {
    VStack {
        @State var isSelected = 12
        @State var isShowSheet = true
        WeeksListView(totalWeeks: 26, selectedWeek: $isSelected, onClick: {index in print(index)})
    }
    
}
