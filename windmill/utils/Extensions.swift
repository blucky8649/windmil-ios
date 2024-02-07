//
//  Extensions.swift
//  windmill
//
//  Created by 이동연 on 1/11/24.
//

import Foundation

extension Double {
    func coerceAtLeast(min: Double) -> Double {
        if (self < min) {
            return min
        } else {
            return self
        }
    }
}

extension Int {
    func toDecimal() -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf.string(for: self) ?? "0"
    }
}
