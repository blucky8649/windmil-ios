//
//  DashboardProgressBarStyle.swift
//  windmill
//
//  Created by 이동연 on 1/1/24.
//

import SwiftUI

struct DashboardProgressBarStyle: ProgressViewStyle {
    
    var color: Color = .main
    var height: Double = 10.0
    var labelFontStyle: Font = .body
    
    var value: Int = 9
    var total: Int = 26
    
    func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0.0
        
        @State var viewHeight: CGSize = .zero
        GeometryReader { geo in
            VStack {
                configuration.label
                    .font(labelFontStyle)
                
                
                HStack {
                    Image(systemName: "arrow.down.heart.fill")
                        .padding(EdgeInsets(top: 0, leading: (geo.size.width * progress) - 12, bottom: 0, trailing: 0))
                        .foregroundColor(.red)
                }.frame(maxWidth :.infinity, alignment: .leading)
                
                    
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(.rightGrayD9)
                        .frame(height: height)
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(.main)
                            .frame(
                                width: geo.size.width * progress,
                                height: height,
                                alignment: .leading
                            )
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                HStack {
                    Text("1주차").font(.system(size: 10))
                    Spacer()
                    Text("\(total)주차").font(.system(size: 10))
                }

            }
        }
        .background(Color.main)
        .frame(height: viewHeight.height)
        
    }
}

#Preview {
    ProgressView(value: 12, total: 26)
        .progressViewStyle(DashboardProgressBarStyle())
}
