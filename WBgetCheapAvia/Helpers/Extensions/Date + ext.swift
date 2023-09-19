//
//  Date+Extensions.swift
//  EventCountdownApp - MVVM-C
//
//  Created by Mikhail Ustyantsev on 03.12.2022.
//

import Foundation

extension Date {
    
   static func dateFromString(_ dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+04:00")
        return dateFormatter.date(from: dateString) ?? Date()
    }
    
   static func  stringFromDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm"
        return dateFormatter.string(from: date)
    }
    
}
