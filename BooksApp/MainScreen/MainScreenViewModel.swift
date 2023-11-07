//
//  MainScreenViewModel.swift
//  BooksApp
//
//  Created by anduser on 06.11.2023.
//

import SwiftUI

final class MainScreenViewModel: ObservableObject {
    
    var response: Response
    @Published var banners: [TopBannerSlide]
    @Published var books: [Book]
    @Published var recommendedBooksIndices: [Int]
    
    init(response: Response) {
        self.response = response
        self.banners = response.topBannerSlides
        self.books = response.books
        self.recommendedBooksIndices = response.youWillLikeSection
    }
    
    func splitBooksByGenre() -> [String: [Book]] {
        return Dictionary(grouping: books, by: { $0.genre })
    }
    
    func sortedBooksInGenre(genre:String) -> [Book] {
        guard let booksInGenre = splitBooksByGenre()[genre] else { return [] }
        return booksInGenre.sorted(by: {$0.id < $1.id})
    }
    
    func sortOutRecommendations() -> [Book] {
        var booksToRecommend = [Book]()
        for id in recommendedBooksIndices {
            if let book = books.first(where: {$0.id == id}) {
                booksToRecommend.append(book)
            }
        }
        return booksToRecommend
    }
    
    func getBookBy(id: Int) -> Book? {
        return books.first(where: { $0.id == id })
    }
}
