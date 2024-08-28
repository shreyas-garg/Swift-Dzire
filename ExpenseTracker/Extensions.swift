//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Shreyas Garg on 27/08/24.
//

import Foundation
import SwiftUI

extension Color{
    static let Background = Color("Background")
    static let Icon = Color("Icon")
    static let Text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
    
    
}

extension DateFormatter{
    static let allNumericUSA: DateFormatter = {
        print("Intializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
      
        return formatter
    }()
}

extension String {
    func dateParsed() ->  Date{
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self)else{return Date()}
                return parsedDate
    }
}

extension Date: Strideable{
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}
