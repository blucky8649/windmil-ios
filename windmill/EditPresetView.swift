//
//  EditPresetView.swift
//  windmill
//
//  Created by 이동연 on 12/1/23.
//

import SwiftUI

struct EditPresetView: View {

    @Binding var contents: String
    var placeHolder: String = ""
    var fontSize = 20.0
    var textContentType: UITextContentType = .givenName
    
    @State private var isFocused = false
    @State private var isInit = false
    @State private var changeCount = 0
    
    private var height: CGFloat {
        return 8.0 + fontSize + 20
    }
    
    private var strokeWeight: CGFloat {
        return (fontSize * 0.07)
    }
    
    private var isLabelUp: Bool {
        return isFocused || !contents.isEmpty
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isFocused ? .blue : .gray, lineWidth: strokeWeight)
                    .frame(height: height)
                
                
                ZStack(alignment: .leading) {
                    Text(placeHolder)
                        .font(.system(size: isLabelUp ? 12 : fontSize))
                        .foregroundColor(isFocused ? .blue : .gray)
                        .padding(2)
                        .background(Color.white)
                        .offset(CGSize(width: isLabelUp ? -4 : 0, height: isLabelUp ? -(height / 2) : 0))
                        .animation(.easeIn(duration: 0.2))
                    
                    
                    TextField("", text: $contents) {
                        isFocused = $0
                    }
                    .textContentType(textContentType)
                    .lineLimit(3)
                    .accentColor(.black)
                    .font(.system(size: fontSize, weight: Font.Weight.medium))
                    .border(Color.white)
                }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 10))
                
            }
        }.padding()
            .frame(maxHeight: height + 10)
    }
}


#Preview {
    VStack {
        @State var aa = "과쟝님 쨩www"
        Text("---Size Test---")
        EditPresetView(contents: $aa, placeHolder: "과쟝님 쨩")
        
        EditPresetView(contents: $aa, placeHolder: "First Name", fontSize: 12.0)
        
        EditPresetView(contents: $aa, placeHolder: "First Name", fontSize: 10.0)
        Text("---PlaceHolder Test---")
        EditPresetView(contents: $aa, placeHolder: "과쟝님 쨩 ✨✨✨", fontSize: 15.0)
        
        EditPresetView(contents: $aa, placeHolder: "과쟝님 쨩 ✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨", fontSize: 15.0)
        
    }
    
}
