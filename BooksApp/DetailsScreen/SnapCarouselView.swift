//
//  SnapCarouselView.swift
//  BooksApp
//
//  Created by anduser on 06.11.2023.
//

import SwiftUI

struct SnapCarouselView: View {
    @Binding var currentIndex: Int
    @Binding var selectedBook: Book
    
    private let books: [Book]
    
    init(selectedBook: Binding<Book>, books: [Book], currentIndex: Binding<Int>) {
        _currentIndex = currentIndex
        _selectedBook = selectedBook
        self.books = books
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(books) { book in
                    CarouselCardView(book: book,
                                     currentIndex: $currentIndex,
                                     geometry: geometry)
                    .offset(x: CGFloat(book.id - currentIndex) * (geometry.size.width * Constants.Common.quarterWidth))
                }
            }
            .padding(.leading, geometry.size.width * Constants.Common.quarterWidth)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        let cardWidth = geometry.size.width * Constants.Common.halfWidth
                        let offset = value.translation.width / cardWidth
                        
                        withAnimation(Animation.spring()) {
                            if value.translation.width < -offset
                            {
                                currentIndex = min(currentIndex + 1, books.count - 1)
                            } else if value.translation.width > offset {
                                currentIndex = max(currentIndex - 1, 0)
                            }
                            selectedBook = books[currentIndex]
                        }
                        
                    }
            )
        }
    }
}

struct Card: Identifiable {
    var id: Int
    var color: Color
}

struct CarouselCardView: View {
    var book: Book
    @Binding var currentIndex: Int
    let geometry: GeometryProxy
    
    var body: some View {
        let cardWidth = geometry.size.width * Constants.Common.halfWidth
        let cardHeight = cardWidth * Constants.Common.extraWidth
        let offset = (geometry.size.width - cardWidth) * Constants.Common.halfWidth
        
        VStack {
            CardView(width: cardWidth, height: cardHeight, coverURL: book.coverURL)
                .opacity(book.id <= currentIndex + 1 ? Constants.Transparency.min : Constants.Transparency.max)
                .scaleEffect(book.id == currentIndex ? Constants.Common.scaleMax : Constants.Common.scaleMin)
        }
        .frame(width: cardWidth, height: cardHeight)
        .offset(x: CGFloat(book.id - currentIndex) * offset)
    }
}
