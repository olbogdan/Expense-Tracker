//
//  ExpenseItem.swift
//  Expense Tracker
//
//  Created by bogdanov on 07.05.21.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
