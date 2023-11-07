//
//  Constants.swift
//  BooksApp
//
//  Created by anduser on 07.11.2023.
//

import SwiftUI

enum Constants {
    
    enum Common {
        static let cornerRadius: CGFloat = 16
        static let cornerRadiusButton: CGFloat = 30
        static let delay: CGFloat = 2.0
        static let scaleMax: CGFloat = 1.0
        static let scaleMin: CGFloat = 0.9
        
        static let wideWidth: CGFloat = 0.8
        static let mediumWidth: CGFloat = 0.7
        static let halfWidth: CGFloat = 0.5
        static let quarterWidth: CGFloat = 0.25
        static let extraWidth: CGFloat = 1.25
        
        static let progressBarWidth: CGFloat = 274
        static let bannerHeight: CGFloat = 167
        static let cardWidth: CGFloat = 120
        static let cardHeight: CGFloat = 150
        static let iconSize: CGFloat = 24
        static let lineHeight: CGFloat = 1
    }
    
    enum Transparency {
        static let min: CGFloat = 1.0
        static let small: CGFloat = 0.8
        static let medium: CGFloat = 0.7
        static let large: CGFloat = 0.2
        static let max: CGFloat = 0.0
    }
    
    enum Fonts {
        static let logo: Font = .custom("Georgia", size: 52).weight(.bold).italic()
        static let nunito12: Font = .custom("Nunito Sans", size: 12).weight(.bold)
        static let nunito14: Font = .custom("Nunito Sans", size: 14).weight(.bold)
        static let nunito16: Font = .custom("Nunito Sans", size: 16).weight(.semibold)
        static let nunito18: Font = .custom("Nunito Sans", size: 18).weight(.bold)
        static let nunito24: Font = .custom("Nunito Sans", size: 24).weight(.bold)
        static let nunito20: Font = .custom("Nunito Sans", size: 20).weight(.bold)
    }
    
    enum ImageNames {
        static let background: String = "background"
        static let hearts: String = "hearts"
        static let detailsBack: String = "detailsBack"
        static let arrowBack: String = "arrowBack"
    }
    
    enum Paddings {
        static let xsPadding: CGFloat = 4
        static let sPadding: CGFloat = 8
        static let mPadding: CGFloat = 16
        static let lPadding: CGFloat = 24
        static let xlPadding: CGFloat = 32
        static let xxlPadding: CGFloat = 64
    }
    
    enum Keys {
        static let jsonKey: String = "json_data"
    }
    
    enum Strings {
        static let welcome: String = "Welcome to Book App\n"
        static let bookApp: String = "Book App"
        static let library: String = "Library"
        static let readers: String = "Readers"
        static let likes: String = "Likes"
        static let quotes: String = "Quotes"
        static let genre: String = "Genre"
        static let summary: String = "Summary"
        static let youWillAlsoLike: String = "You will also like"
        static let readNow: String = "Read now"
    }
    
    enum Colors {
        static let pink: Color = Color(red: 0.87, green: 0.28, blue: 0.63)
        static let darkPink: Color = Color(red: 0.82, green: 0, blue: 0.43)
        static let line: Color = Color(red: 0.85, green: 0.84, blue: 0.84)
    }
    
}
