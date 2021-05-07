//
//  AddView.swift
//  Expense Tracker
//
//  Created by bogdanov on 07.05.21.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""

    let types = ["Business", "Personal"]
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(amount) {
                    expenses.items.append(ExpenseItem(name: name, type: type, amount: actualAmount))
                }
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
