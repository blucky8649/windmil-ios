//
//  CustomNavBackButton.swift
//  windmill
//
//  Created by 이동연 on 2/19/24.
//

import SwiftUI

struct CustomNavBackButton: View {
    let dismiss: DismissAction?
    
    var body: some View {
        Button {
            dismiss?.callAsFunction()
        } label: {
            Image(.navigateBack)
                .renderingMode(.template)
                .foregroundColor(.main)
        }
    }
}

// Custom Back Button 사용시의 Swipe-back 활성화 코드
extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}


#Preview {
    CustomNavBackButton(dismiss: nil)
}
