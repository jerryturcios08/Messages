//
//  Date+Ext.swift
//  Messages
//
//  Created by Jerry Turcios on 4/23/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import Foundation

extension Date {
    static func dateFromCustomString(_ customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}
