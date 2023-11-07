//
//  BannerCarousel.swift
//  BooksApp
//
//  Created by anduser on 06.11.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct BannerCarousel: View {
    
    @State var items: [TopBannerSlide]
    @State var currentIndex = 0
    
    private var onTap: (Int) -> Void
    
    init(items: [TopBannerSlide], onTap: @escaping (Int) -> Void) {
        self.items = items
        self.onTap = onTap
    }
    
    var body: some View {

        TabView(selection: $currentIndex)  {
            ForEach(items) { item in
                WebImage(url: URL(string: item.cover))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: Constants.Common.bannerHeight)
                    .background(Color.gray)
                    .onTapGesture {
                        onTap(item.bookID)
                    }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: Constants.Common.cornerRadius))
        .tabViewStyle(.page)
        .frame(height: Constants.Common.bannerHeight)
        .padding(.horizontal, Constants.Paddings.sPadding)
        .onReceive(Timer.publish(every: 3, on: .main, in: .common).autoconnect()) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % items.count
            }
        }
    }
}
