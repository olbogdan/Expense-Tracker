//
//  ExpenseItem.swift
//  Expense Tracker
//
//  Created by bogdanov on 07.05.21.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Int
}
