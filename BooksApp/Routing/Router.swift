//
//  Router.swift
//  BooksApp
//
//  Created by anduser on 06.11.2023.
//

import SwiftUI

final class Router: ObservableObject {
    
    @Published var currentView: AnyView?
    
    init() {
        self.navigateTo(.splashScreen)
    }
    
    func navigateTo(_ view: Route) {
        switch view {
        case .splashScreen:
            currentView = AnyView(SplashScreen())
        case .main(let viewModel):
            currentView = AnyView(MainScreen(viewModel: viewModel))
        case .detailed(let viewModel):
            currentView = AnyView(DetailsScreen(viewModel: viewModel))
        }
    }
}

enum Route {
    case splashScreen
    case main(MainScreenViewModel)
    case detailed(DetailsScreenViewModel)
}

