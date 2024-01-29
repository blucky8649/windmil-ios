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
