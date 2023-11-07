//
//  CardView.swift
//  BooksApp
//
//  Created by anduser on 06.11.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    
    private let width: CGFloat
    private let height: CGFloat
    private let coverURL: String
    
    init(width: CGFloat, height: CGFloat, coverURL: String) {
        self.width = width
        self.height = height
        self.coverURL = coverURL
    }
    
    var body: some View {
        WebImage(url: URL(string: coverURL))
            .resizable()
            .indicator(.activity)
            .frame(width: width, height: height)
            .aspectRatio(contentMode: .fill)
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: Constants.Common.cornerRadius))
    }
}
