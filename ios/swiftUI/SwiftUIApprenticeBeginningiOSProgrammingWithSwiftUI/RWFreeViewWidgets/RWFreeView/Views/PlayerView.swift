/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI
import AVKit

struct PlayerView: View {
  let episode: Episode
  @State private var showPlayer = false
  @Environment(\.verticalSizeClass) var vSizeClass

  private func height9(to16 width: CGFloat) -> CGFloat {
    return (width - 20.0) * 9.0 / 16.0
  }

  var body: some View {
    if let url = URL(string: episode.videoURL?.urlString ?? "") {
      GeometryReader { proxy in
        VStack {
          VideoPlayer(player: AVPlayer(url: url))
            .frame(
              maxHeight: vSizeClass == .regular ?
                height9(to16: proxy.size.width) : .infinity)
            .padding(15)
            .roundedGradientBackground()

          // Show video info in iPad or iPhone portrait orientation
          if vSizeClass == .regular {
            VStack(spacing: 16) {
              Text(episode.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(UIColor.label))
              HStack(spacing: 15) {
                Text(episode.released)
                Text(episode.domain)
                Text(String(episode.difficulty ?? "").capitalized)
              }
              Text(episode.description)
                .padding(.horizontal)
            }
            .foregroundColor(Color(UIColor.systemGray))
          }
          Spacer()
        }
        .navigationTitle(episode.name)
        .navigationBarTitleDisplayMode(.inline)
      }
    } else {
      PlaceholderView()
    }
  }
}

struct PlayView_Previews: PreviewProvider {
  static var previews: some View {
    let store = EpisodeStore()
    Group {
      NavigationView {
        PlayerView(episode: store.episodes[0])
      }
      .navigationViewStyle(StackNavigationViewStyle())

      // landscape view shows only VideoPlayer
      PlayerView(episode: store.episodes[0])
        .previewLayout(.fixed(width: 896.0, height: 414.0))
    }
  }
}

extension View {
  /// Set the background to app's gradient with rounded bottom corners
  func roundedGradientBackground() -> some View {
    self
      .background(
        LinearGradient(
          gradient: Gradient(
            colors: [Color.gradientDark, Color.gradientLight]),
          startPoint: .leading,
          endPoint: .trailing)
      )
      .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
  }
}

struct PlaceholderView: View {
  var body: some View {
    VStack {
      Text("""
        Placeholder episode
        No video
        """)
        .font(.title)
        .multilineTextAlignment(.center)
        .padding(15)
        .roundedGradientBackground()
      Spacer()
    }
  }
}
