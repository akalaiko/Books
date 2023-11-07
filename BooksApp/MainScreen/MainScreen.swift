//
//  MainScreen.swift
//  BooksApp
//
//  Created by anduser on 06.11.2023.
//

import SwiftUI

struct MainScreen: View {
    
    @ObservedObject var viewModel: MainScreenViewModel
    @EnvironmentObject var router: Router
    
    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Text(Constants.Strings.library)
                        .font(Constants.Fonts.nunito20)
                        .foregroundColor(Constants.Colors.darkPink)
                        .padding(.horizontal, Constants.Paddings.sPadding)
                    Spacer()
                }
                BannerCarousel(items: viewModel.banners) { bookId in
                    guard let book = viewModel.getBookBy(id: bookId) else { return }
                    router.navigateTo(.detailed(DetailsScreenViewModel(selectedBook: book,
                                                                       books: viewModel.books,
                                                                       interestingBooks: viewModel.sortOutRecommendations(),
                                                                       response: viewModel.response)))
                }
                    .padding(.bottom, Constants.Paddings.lPadding)
            }
            ForEach(Array(viewModel.splitBooksByGenre().keys), id: \.self) { genre in
                BookSection(title: genre, books: viewModel.splitBooksByGenre()[genre] ?? [], textColor: .white) { book in
                    router.navigateTo(.detailed(DetailsScreenViewModel(selectedBook: book,
                                                                       books: viewModel.books,
                                                                       interestingBooks: viewModel.sortOutRecommendations(),
                                                                       response: viewModel.response)))
                }
            }
            Spacer()
        }
        .padding(.horizontal, Constants.Paddings.sPadding)
        .background(.black)
    }
}
