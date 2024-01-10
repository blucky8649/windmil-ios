//
//  WindmillProgressView.swift
//  windmill
//
//  Created by 이동연 on 1/2/24.
//

import SwiftUI

struct WindmillProgressView: View {
    
    init(value: Int, total: Int, height: Double) {
        self._value = value
        self.total = total
        self.height = height
    }
    
    @State private var animatedValue: CGFloat = 0.0
    
    private var progress: CGFloat {
        get {
            return CGFloat(value) / CGFloat(total)
        }
    }
    
    var _value: Int
    var value: Int {
        return _value.coerceAtMost(max: total)
    }
    // TODO: _value, value 에 관한 getter, setter 적용 방법도 알고싶다.
    
    var total: Int = 26
    var height: Double = 10.0
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                VStack {
                    Text("\(value)주차").font(.system(size: 10))
                        .frame(width: 50)
                    Image(systemName: "arrow.down.heart.fill")
                        
                        .foregroundColor(.red)
                }.frame(maxWidth :geo.size.width, alignment: .leading)
                    .offset(x: (geo.size.width * animatedValue) - 25)
                    .animation(.easeInOut(duration: 2.5))
                
                
                ZStack {
                    VStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(.rightGrayD9)
                            .frame(maxWidth: geo.size.width, maxHeight: height)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                        
                    VStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(.purpleDefault)
                            .frame(
                                width: geo.size.width * animatedValue,
                                height: height,
                                alignment: .leading
                            )
                            .animation(.easeInOut(duration: 2.5))
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                }.onAppear {
                    withAnimation {
                        animatedValue = progress
                    }
                }
                
                HStack {
                    Text("1주차").font(.system(size: 10))
                    Spacer()
                    Text("\(total)주차").font(.system(size: 10))
                }
            }
        }
        .frame(height: 65)
    }
}

#Preview {
    WindmillProgressView(value: 44, total: 26, height: 10)
}


extension Int {
    func coerceAtMost(max: Int) -> Int {
        if self > max {
            return max
        } else {
            return self
        }
    }
}
