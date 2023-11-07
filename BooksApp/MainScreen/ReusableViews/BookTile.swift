//
//  BookTile.swift
//  BooksApp
//
//  Created by anduser on 06.11.2023.
//

import SwiftUI


struct BookTile: View {
    
    private var book: Book
    private var textColor: Color
    
    init(book: Book, textColor: Color) {
        self.book = book
        self.textColor = textColor
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            CardView(width: Constants.Common.cardWidth, height: Constants.Common.cardHeight, coverURL: book.coverURL)
            VStack {
                Text(book.name)
                    .lineLimit(nil)
                    .font(Constants.Fonts.nunito16)
                    .foregroundColor(textColor.opacity(Constants.Transparency.medium))
                    .padding(.top, Constants.Paddings.sPadding)
                Spacer()
            }
        }
        .frame(width: Constants.Common.cardWidth)
        .frame(maxHeight: .infinity)
        .padding(Constants.Paddings.sPadding)
    }
}
