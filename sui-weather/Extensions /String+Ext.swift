//
//  String+Ext.swift
//  sui-weather
//
//  Created by Egor Tushev on 27.05.2024.
//

import Foundation

extension String {
    func toDayOfTheWeek() -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let date = df.date(from: self) ?? Date()
        df.dateFormat = "EE"
        return df.string(from: date).capitalized(with: Locale())
    }
}
