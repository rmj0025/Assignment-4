//
//  SavedQuotesView.swift
//  Assignment 4
//
//

import SwiftUI

struct SavedQuotesView: View {
    
    @ObservedObject private var viewModel = QuotesViewModel()
    @State private var quote = Quote(author: "", body: "")
    
    var body: some View {
        List {
            ForEach($viewModel.quotes) { $quote in
                QuoteDetailView(quote: $quote)
            }
        }
        .onAppear {
            viewModel.fetchUserQuotes()
        }
        .navigationTitle("Saved Quotes")
    }
}

#Preview {
    SavedQuotesView()
}
