//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Shreyas Garg on 28/08/24.
//

import SwiftUI

struct TransactionList: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        
        VStack{
            List{
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key){
                    month, transactions in Section{
                        ForEach(transactions){
                            transaction in
                            TransactionRow(transaction: transaction)
                        }
                        
                        
                    }
                    header: {Text(month)}
                        .listSectionSeparator(.hidden)
                }
            }
            
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider{
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = tranactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View{
        Group{
            NavigationView{
                TransactionList()
            }
            NavigationView{
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
