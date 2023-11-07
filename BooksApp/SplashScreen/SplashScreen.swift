//
//  ContentView.swift
//  BooksApp
//
//  Created by anduser on 06.11.2023.
//

import Firebase
import SwiftUI

struct SplashScreen: View {
    
    @EnvironmentObject var router: Router
    @State var progress: CGFloat = 0.2
    private let networkManager: NetworkManagerProtocol = NetworkManager()
    
    var body: some View {
        ZStack {
            Image(Constants.ImageNames.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .overlay(content: { Image(Constants.ImageNames.hearts).resizable() })
            
            VStack {
                Spacer()
                Text(Constants.Strings.bookApp)
                    .font(Constants.Fonts.logo)
                    .foregroundColor(Constants.Colors.pink)
                    .padding(Constants.Paddings.xsPadding)
                Text(Constants.Strings.welcome)
                    .font(Constants.Fonts.nunito24)
                    .foregroundColor(.white.opacity(Constants.Transparency.small))
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle())
                    .tint(.white)
                    .frame(maxWidth: Constants.Common.progressBarWidth)
                    .onAppear {
                        let _ = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { _ in
                            if progress <= 0.9 {
                                withAnimation(.linear) {
                                    progress += 0.1
                                }
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.Common.delay) {
                            networkManager.fetchContentFromFirebase { result in
                                switch result {
                                case .success(let response):
                                    DispatchQueue.main.async {
                                        router.navigateTo(.main(MainScreenViewModel(response: response)))
                                    }
                                case .failure(let error):
                                    Crashlytics.crashlytics().record(error: error)
                                }
                            }
                        }
                    }
                Spacer()
            }
            .padding()
        }
    }
}
