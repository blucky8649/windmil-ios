//
//  WindmillProgressView.swift
//  windmill
//
//  Created by 이동연 on 1/2/24.
//

import SwiftUI

struct WindmillProgressView: View {
    
    var value: Int = 9
    var total: Int = 26
    var height: Double = 10.0
    
    private var progress: CGFloat {
        get {
            return CGFloat(value) / CGFloat(total)
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                VStack {
                    Text("\(value)주차!")
                        .font(.system(size: 10))
                        .frame(width: 50)
                    Image(systemName: "arrow.down.heart.fill")
                        .foregroundColor(.red)
                }.frame(maxWidth :geo.size.width, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: (geo.size.width * progress - 50) , bottom: 0, trailing: 0))
                    .background(Color.gray)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(.rightGrayD9)
                        .frame(width: geo.size.width - 50, height: height)
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(.purpleDefault)
                            .frame(
                                width: geo.size.width * progress,
                                height: height,
                                alignment: .leading
                            )
                            .animation(.easeInOut(duration: 10).repeatForever(autoreverses: true), value: geo.size.width * progress)
                    }.frame(maxWidth: geo.size.width, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                    
                }
                
                HStack {
                    Text("숙제ㅔ").font(.system(size: 10))
                    Spacer()
                    Text("\(total)주차").font(.system(size: 10))
                }
            }
        }
        .frame(height: 65)
    }
}

#Preview {
    WindmillProgressView(value: 26, total: 26, height: 10)
}
