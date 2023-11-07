//
//  Routing.swift
//  BooksApp
//
//  Created by anduser on 06.11.2023.
//

import SwiftUI

struct Routing: View {
    
    @StateObject var router = Router()
    
    var body: some View {
        router.currentView
            .environmentObject(router)
    }
}

#Preview {
    Routing()
}
