//
//  DateComponents+formattedTime.swift
//  TrackerDemo
//
//  Created by Steven Curtis on 01/09/2020.
//  Copyright © 2020 Steven Curtis. All rights reserved.
//

import Foundation

extension DateComponents {
    var formattedTime: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: self) ?? ""
    }
}
