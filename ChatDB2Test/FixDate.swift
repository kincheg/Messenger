//
//  FixDate.swift
//  DB2LimitedTest
//
//  Created by kin on 10.06.17.
//  Copyright © 2017 kin. All rights reserved.
//

import Foundation

extension Foundation.Date {
    
    func dashedStringFromDate() -> String {
        let dateFormatter = DateFormatter()
        let date = self
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
}
