//
//  WindmillProgressView.swift
//  windmill
//
//  Created by 이동연 on 1/2/24.
//

import SwiftUI


struct WeekValue {
    // FIXME: 적당한 네이밍으로 수정해주셔도 좋을것같아요!
    var total: Int = 26
    
    private var _week: Int = 0
    var week: Int {
        get {
            return _week
        }
        set(newValue) {
            if (newValue > total) {
                _week = total
            } else {
                _week = newValue
            }
        }
    }
    
    init(total: Int, week: Int) {
        self.total = total
        self.week = week
    }
}


struct WindmillProgressView: View {
    var weekValue: WeekValue = WeekValue(total: 0, week: 0)
    var height: Double = 10.0
    
    private var progress: CGFloat {
        get {
            return CGFloat(weekValue.week) / CGFloat(weekValue.total)
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                VStack {
                    Text("\(weekValue.week)주차").font(.system(size: 10))
                        .frame(width: 50)
                    Image(systemName: "arrow.down.heart.fill")
                    
                        .foregroundColor(.red)
                }.frame(maxWidth :geo.size.width, alignment: .leading)
                    .offset(x: (geo.size.width * progress) - 25)
//                    .animation(.easeIn(duration: 2.5))
                
                ZStack {
                    VStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(.surfaceContainerHighest)
                            .frame(maxWidth: geo.size.width, maxHeight: height)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(.main)
                            .frame(
                                width: geo.size.width * progress,
                                height: height,
                                alignment: .leading
                            )
//                            .animation(.easeIn(duration: 2.5))
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                HStack {
                    Text("1주차").font(.system(size: 10))
                    Spacer()
                    Text("\(weekValue.total)주차").font(.system(size: 10))
                }
            }
        }
        .frame(height: 65)
    }
}

#Preview {
    WindmillProgressView(weekValue: WeekValue(total: 26, week: 2), height: 10)
}
