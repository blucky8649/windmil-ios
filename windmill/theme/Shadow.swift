//
//  Shadow.swift
//  windmill
//
//  Created by 이동연 on 1/21/24.
//

import SwiftUI

extension View {
    func withShadow(type: ElevationType = .elevation1) -> some View {
        return switch(type) {
            case .elevation1 : self.shadow(color: .black.opacity(0.15), radius: 1.5, x: 0, y: 1)
                    .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
            case .elevation2 : self.shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: 2)
                    .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
            case .elevation3 : self.shadow(color: .black.opacity(0.3), radius: 1.5, x: 0, y: 1)
                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 4)
            case .elevation4 : self.shadow(color: .black.opacity(0.3), radius: 1.5, x: 0, y: 2)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 6)
            case .elevation5 : self.shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 4)
                    .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 8)
        }
    }
}

enum ElevationType {
    case elevation1
    case elevation2
    case elevation3
    case elevation4
    case elevation5
}
