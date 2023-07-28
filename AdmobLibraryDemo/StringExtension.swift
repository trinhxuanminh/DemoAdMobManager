//
//  StringExtension.swift
//  AdmobLibraryDemo
//
//  Created by Trịnh Xuân Minh on 26/03/2022.
//

import Foundation

extension String {
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }
}
