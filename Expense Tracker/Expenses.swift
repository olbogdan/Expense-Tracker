//
//  Expenses.swift
//  Expense Tracker
//
//  Created by bogdanov on 07.05.21.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
