//
//  ContentView.swift
//  Expense Tracker
//
//  Created by bogdanov on 06.05.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses: Expenses
    @State private var showingAddExpense = false

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("My expense")
            .navigationBarItems(trailing:
                Button(action: {
                    showingAddExpense = true
                }, label: {
                    Image(systemName: "plus")
                }))
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }

    func removeItems(as offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(expenses: Expenses())
    }
}
