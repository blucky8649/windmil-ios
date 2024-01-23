//
//  WindmillAlgorithm.swift
//  windmill
//
//  Created by 이동연 on 1/23/24.
//

import Foundation

func solution(totalWeeks: Int, weeklyIncrease: Int, targetWeek: Int) -> Int {
    var dp: [Int] = [] // 주차별 내야할 금액이 담긴 배열
    var acc: [Int] = [] // 주차별 총 누적된 납부 금액
    (0..<totalWeeks).forEach { week in
        if (dp.isEmpty) {
            dp.append(weeklyIncrease)
            acc.insert(dp[week], at: week)
            return
        }
        // 이번주 납부 금액 : 이전 납부액 + 현재 주차 * 증가액
        dp.insert(dp[week-1] + weeklyIncrease * (week + 1), at: week)
        acc.insert(dp[week] + acc[week-1], at: week)
    }
    print(acc)
    print(dp)
    return acc[targetWeek - 1]
}
