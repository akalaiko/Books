//
//  DetailsScreen.swift
//  sampler
//
//  Created by anduser on 06.11.2023.
//

import Firebase
import SwiftUI

struct DetailsScreen: View {
    
    @EnvironmentObject var router: Router
    @ObservedObject var viewModel: DetailsScreenViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: .zero) {
                        
                        SnapCarouselView(selectedBook: $viewModel.selectedBook, books: viewModel.books, currentIndex: $viewModel.selectedID)
                            .frame(width: geometry.size.width, height: geometry.size.width * Constants.Common.halfWidth * Constants.Common.extraWidth)
                            .padding(.vertical, Constants.Paddings.mPadding)
                            .background(Image(Constants.ImageNames.detailsBack)
                                .resizable()
                                .scaledToFill())
                        
                        Text(viewModel.selectedBook.name)
                            .font(Constants.Fonts.nunito20)
                            .foregroundColor(.white)
                        Text(viewModel.selectedBook.author)
                            .font(Constants.Fonts.nunito14)
                            .foregroundColor(.white.opacity(Constants.Transparency.large))
                            .padding(.bottom, Constants.Paddings.mPadding)
                        ZStack {
                            Rectangle()
                                .frame(maxHeight: .infinity)
                                .foregroundColor(.white)
                                .cornerRadius(Constants.Paddings.mPadding)
                            VStack(spacing: .zero) {
                                HStack {
                                    InfoPoint(title: viewModel.selectedBook.views, subTitle: Constants.Strings.readers)
                                    InfoPoint(title: viewModel.selectedBook.likes, subTitle: Constants.Strings.likes)
                                    InfoPoint(title: viewModel.selectedBook.quotes, subTitle: Constants.Strings.quotes)
                                    InfoPoint(title: viewModel.selectedBook.genre, subTitle: Constants.Strings.genre)
                                }
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(height: Constants.Common.lineHeight)
                                    .background(Constants.Colors.line)
                                    .padding(Constants.Paddings.mPadding)
                                
                                HStack {
                                    Text(Constants.Strings.summary)
                                        .font(Constants.Fonts.nunito20)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                .padding(.horizontal, Constants.Paddings.mPadding)
                                Text(viewModel.selectedBook.summary)
                                    .font(Constants.Fonts.nunito16)
                                    .foregroundColor(.black)
                                    .padding(Constants.Paddings.mPadding)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(height: Constants.Common.lineHeight)
                                    .background(Constants.Colors.line)
                                    .padding(.horizontal, Constants.Paddings.mPadding)
                                
                                BookSection(title: Constants.Strings.youWillAlsoLike, books: viewModel.interestingBooks, textColor: .black) { book in
                                    viewModel.selectedBook = book
                                    viewModel.selectedID = book.id
                                }
                                .padding(.top, Constants.Paddings.mPadding)
                                .padding(.leading, Constants.Paddings.sPadding)
                                
                                Button(action: {
                                    // action in not defined in document
                                    Crashlytics.crashlytics().log("User wants to read the book")
                                }) {
                                    Text(Constants.Strings.readNow)
                                        .font(Constants.Fonts.nunito20)
                                        .foregroundColor(.white)
                                        .padding(Constants.Paddings.mPadding)
                                }
                                .frame(width: geometry.size.width * Constants.Common.wideWidth)
                                .background(Constants.Colors.pink)
                                .cornerRadius(Constants.Common.cornerRadiusButton)
                                .padding(.bottom, Constants.Paddings.xxlPadding)
                            }
                            .padding(.vertical, Constants.Paddings.mPadding)
                        }
                    }
                }
                .ignoresSafeArea(edges: .bottom)
                
                Button(action: {
                    router.navigateTo(.main(MainScreenViewModel(response: viewModel.response)))
                }) {
                    Image(Constants.ImageNames.arrowBack)
                        .resizable()
                        .scaledToFit()
                        .frame(width: Constants.Common.iconSize, height: Constants.Common.iconSize)
                }
                .padding(.leading, Constants.Paddings.mPadding)
            }
        }
        .background(.black)
    }
}

struct InfoPoint: View {
    
    private var title: String
    private var subTitle: String
    
    init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(Constants.Fonts.nunito18)
                .foregroundColor(.black)
            Text(subTitle)
                .font(Constants.Fonts.nunito12)
                .foregroundColor(.black.opacity(Constants.Transparency.large))
        }
        .padding(.horizontal, Constants.Paddings.mPadding)
    }
}
