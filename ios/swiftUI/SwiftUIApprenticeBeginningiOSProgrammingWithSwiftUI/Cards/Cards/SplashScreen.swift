//
//  SplashScreen.swift
//  Cards
//
//  Created by rhino Q on 2023/03/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
          Color("background")
            .edgesIgnoringSafeArea(.all)
          card(letter: "S", color: "appColor1")
            .modifier(SplashAnimation(finalYPosition: 240, delay: 0))
          card(letter: "D", color: "appColor2")
            .modifier(SplashAnimation(finalYPosition: 120, delay: 0.2))
          card(letter: "R", color: "appColor3")
            .modifier(SplashAnimation(finalYPosition: 0, delay: 0.4))
          card(letter: "A", color: "appColor6")
            .modifier(SplashAnimation(finalYPosition: -120, delay: 0.6))
          card(letter: "C", color: "appColor7")
            .modifier(SplashAnimation(finalYPosition: -240, delay: 0.8))
        }
    }
    
    private struct SplashAnimation: ViewModifier {
        @State private var animating = true
        let finalYPosition:CGFloat
        let delay:Double
        
        func body(content: Content) -> some View {
            content
                .offset(y:animating ? -700 : finalYPosition)
                .rotationEffect(
                  animating ? .zero
                    : Angle(degrees: Double.random(in: -10...10)))
                .animation(
                    Animation.interpolatingSpring(
                      mass: 0.2,
                      stiffness: 80,
                      damping: 5,
                      initialVelocity: 0.0)
                      .delay(delay)
                )
                .onAppear {
                    animating = false
                }
        }
    }
    
    func card(letter: String, color:String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .shadow(radius: 3)
                .frame(width: 120, height: 160)
                .foregroundColor(.white)
            Text(letter)
                .fontWeight(.bold)
                .scalableText()
                .foregroundColor(Color(color))
                .frame(width: 80)
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
