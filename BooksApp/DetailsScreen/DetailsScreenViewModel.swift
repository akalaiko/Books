//
//  DetailsScreenViewModel.swift
//  BooksApp
//
//  Created by anduser on 06.11.2023.
//

import SwiftUI

final class DetailsScreenViewModel: ObservableObject {

    var response: Response
    @Published var selectedBook: Book
    @Published var selectedID: Int
    @Published var books: [Book]
    @Published var interestingBooks: [Book]
    
    init(selectedBook: Book, books: [Book], interestingBooks: [Book], response: Response) {
        self.selectedBook = selectedBook
        self.books = books
        self.interestingBooks = interestingBooks
        self.selectedID = selectedBook.id
        self.response = response
    }
}
