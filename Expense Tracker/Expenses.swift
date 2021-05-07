//
//  Expenses.swift
//  Expense Tracker
//
//  Created by bogdanov on 07.05.21.
//

import Foundation

class Expenses: ObservableObject {
    private let encoder = JSONEncoder()
    private let ITEMS_KEY = "ITEMS_KEY"
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: ITEMS_KEY)
            }
        }
    }

    init() {
        if let items = UserDefaults.standard.data(forKey: ITEMS_KEY) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
            }
        }
    }
}
