//
//  MainPage.swift
//  Assignment 4
//
//

import SwiftUI

struct MainPage: View {
    @StateObject private var viewModel = QuotesViewModel()
    
    var body: some View {
        VStack {
            if let quote = viewModel.quote {
                Text("\"\(quote.body)\"")
                    .font(.title)
                    .padding()
                Text("- \(quote.author)")
                    .font(.title2)
                    .padding()
            } else if viewModel.hasError {
                Text("ErrorL \(viewModel.error?.localizedDescription ?? "Unknown error")")
            } else {
                ProgressView()
            }
            
            HStack {
                Button(action: {
                    Task {
                        await viewModel.fetchRandomQuote()
                    }
                }) {
                    Text("Refresh Quote")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    Task {
                        viewModel.saveQuote()
                    }
                }) {
                    Text("Save Quote")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            
            NavigationLink(destination: SavedQuotesView()) {
                Text("View Saved Quotes")
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
        }
        .task {
            await viewModel.fetchRandomQuote()
        }
        .padding()
    }
}

#Preview {
    MainPage()
}
