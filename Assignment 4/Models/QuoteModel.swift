//
//  QuoteModel.swift
//  Assignment 4
//
//

import Foundation
import FirebaseFirestoreSwift

struct Quote: Codable, Identifiable {
    @DocumentID var id: String?
    var author: String
    var body: String
}

struct QuoteResponse: Codable {
    var quote: Quote
}
