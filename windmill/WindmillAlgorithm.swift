//
//  WindmillAlgorithm.swift
//  windmill
//
//  Created by 이동연 on 1/23/24.
//

import Foundation

func createPreset(
    presetName: String,
    totalWeeks: Int,
    weeklyIncrease: Int,
    targetWeek: Int
) -> Preset {
    var dp: [Int] = [] // 주차별 내야할 금액이 담긴 배열
    var acc: [Int] = [] // 주차별 총 누적된 납부 금액
    var accountsByWeek: [[Int]] = [[]]
    var data = (0..<totalWeeks).map { week in
        if (dp.isEmpty) {
            dp.append(weeklyIncrease)
            acc.insert(dp[week], at: week)
            accountsByWeek.insert([weeklyIncrease], at: week)
            return WeeklyData(
                week: week + 1,
                amountAcc: acc[week],
                accountsAcc: accountsByWeek[week]
            )
        }
        // 이번주 납부 금액 : 이전 납부액 + 현재 주차 * 증가액
        dp.insert(dp[week-1] + weeklyIncrease * (week + 1), at: week)
        var prevAccounts = [Int](accountsByWeek[week-1])
        prevAccounts.append(dp[week])
        accountsByWeek.insert(prevAccounts, at: week)
        acc.insert(dp[week] + acc[week-1], at: week)
        
        return WeeklyData(
            week: week + 1,
            amountAcc: acc[week],
            accountsAcc: accountsByWeek[week]
        )
    }
    print(acc)
    print(dp)
    print(accountsByWeek)
    
    return Preset(
        name: presetName,
        totalWeeks: totalWeeks,
        weeklyIncrease: weeklyIncrease,
        weeklyData: data
    )
}
