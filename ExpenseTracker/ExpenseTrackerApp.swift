//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Shreyas Garg on 27/08/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}

