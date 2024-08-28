//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Shreyas Garg on 27/08/24.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
//    var demodata: [Double] = [1,2,3,4,5]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                Text("OverView")
                        .font(.title2)
                        .bold()
                    
                    let data = transactionListVM.accumulateTransactions()
                    let totalExpenses = data.last?.1 ?? 0
                    CardView {
                        VStack{
                            ChartLabel(totalExpenses.formatted(.currency(code: "INR")), type: .title)
                            LineChart()
                        }
                        .background(Color.systemBackground)
                           
                    }
                    .data(data)
                    .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                    .frame(height: 300)
                    
                    
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
        .accentColor(.primary)
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
