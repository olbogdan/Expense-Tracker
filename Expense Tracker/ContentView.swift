//
//  ContentView.swift
//  Expense Tracker
//
//  Created by bogdanov on 06.05.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses: Expenses

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
            }
            .navigationBarTitle("My expense")
            .navigationBarItems(trailing:
                Button(action: {
                    let expense = ExpenseItem(name: "text", type: "", amount: 50)
                    self.expenses.items.append(expense)
                }, label: {
                    Image(systemName: "plus")
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(expenses: Expenses())
    }
}
