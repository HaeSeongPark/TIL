//
//  AppLoadingView.swift
//  Cards
//
//  Created by rhino Q on 2023/03/23.
//

import SwiftUI

struct AppLoadingView: View {
    @State private var showSplash = true
    
    var body: some View {
        if showSplash {
            SplashScreen()
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            showSplash = false
                        }
                    }
                }
        } else {
            CardsView()
                .transition(.scale(scale: 0, anchor: .top))
        }
    }
}

//struct AppLoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppLoadingView()
//            .environmentObject(CardStore(defaultData: true))
//    }
//}
