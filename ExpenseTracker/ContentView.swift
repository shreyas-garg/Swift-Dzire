//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Shreyas Garg on 27/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                Text("OverView")
                        .font(.title2)
                        .bold()
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.Background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        
                        .foregroundStyle(Color.Icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider{
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = tranactionListPreviewData
        return transactionListVM
    }()
    static var previews : some View{
        Group{
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
