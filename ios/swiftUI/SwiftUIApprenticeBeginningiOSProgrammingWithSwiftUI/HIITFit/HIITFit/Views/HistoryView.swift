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

struct HistoryView: View {
    @EnvironmentObject var history: HistoryStore
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var showHistory: Bool
    
    @State var layoutType = LayoutType.list
    
    
    enum LayoutType {
        case list, bar
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                closeButton
                VStack {
                    VStack {
                        Text("History")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        layout
                    }
                    .frame(height: geometry.size.height * 0.15)
                    Spacer()
                    if layoutType == .list {
                        HistoryListView()
                    } else {
                        HistoryBarView()
                    }
                }
            }
        }
    }
    
    var layout: some View {
        HStack {
            if layoutType == .list {
                Button(action: {
                    layoutType = .bar
                }, label: {
                    Image(systemName: "square.grid.2x2.fill")
                        .padding([.leading, .trailing], 20)
                })
                .buttonStyle(EmbossedButtonStyle())
                Button(action: {
                    layoutType = .bar
                }, label: {
                    Image(systemName: "chart.bar.fill")
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(.gray)
                })
            } else {
                Button(action: {
                    layoutType = .list
                }, label: {
                    Image(systemName: "square.grid.2x2.fill")
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(.gray)
                })
                Button(action: {
                    layoutType = .list
                }, label: {
                    Image(systemName: "chart.bar.fill")
                        .padding([.leading, .trailing], 20)
                })
                .buttonStyle(EmbossedButtonStyle())
            }
        }
    }
    
    var closeButton: some View {
        ZStack(alignment: .topTrailing) {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                // swiftlint:disable:next multiple_closures_with_trailing_closure
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.primary)
            }
            .font(.title2)
            .padding([.top, .trailing], 25)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
            .environmentObject(HistoryStore(debugData: true))
    }
}
