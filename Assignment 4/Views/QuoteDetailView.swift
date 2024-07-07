//
//  QuoteDetailView.swift
//  Assignment 4
//
//

import SwiftUI

struct QuoteDetailView: View {
    @Binding var quote: Quote
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\"\($quote.body)\"")
                .font(.body)
            Text("\"\($quote.author)\"")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    QuoteDetailView(quote: .constant(Quote(author: "", body: "")))
}
