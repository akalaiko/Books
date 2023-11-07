//
//  BookSection.swift
//  BooksApp
//
//  Created by anduser on 06.11.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookSection: View {

    @State var books: [Book]
    private var onTap: (Book) -> Void
    private let title: String
    private let textColor: Color
    
    init(title: String, books: [Book], textColor: Color, onTap: @escaping (Book) -> Void) {
        self.title = title
        self.books = books
        self.textColor = textColor
        self.onTap = onTap
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                Text(title.capitalized)
                    .font(Constants.Fonts.nunito20)
                    .foregroundColor(textColor)
                    .padding(.leading, Constants.Paddings.sPadding)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment:.top, spacing: .zero) {
                    ForEach(books) { book in
                        BookTile(book: book, textColor: textColor)
                            .onTapGesture {
                                onTap(book)
                            }
                    }
                }
            }
            Spacer()
        }
    }
}
