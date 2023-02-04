/// Copyright (c) 2020 Razeware LLC
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

import XCTest
import Combine
import SwiftUI
@testable import ColorCalc

class ColorCalcTests: XCTestCase {
    var viewModel: CalculatorViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    override func setUp() {
        viewModel = CalculatorViewModel()
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    func test_correnctNameReceived() {
        let expecetd = "rwGreen 66%"
        var result = ""
        
        viewModel.$name
            .sink(receiveValue:  { result = $0 })
            .store(in: &subscriptions)
        
        viewModel.hexText = "006636AA"
        
        XCTAssert(result == expecetd, "Name expected to be \(expecetd) but was \(result)")
    }
    
    func test_processBackspaceDeletesLastCharacter() {
        let expcetd = "#0080F"
        var result = ""
        
        viewModel.$hexText
            .dropFirst()
            .sink(receiveValue: { result = $0 })
            .store(in: &subscriptions)
        
        viewModel.process(CalculatorViewModel.Constant.backspace)
        
        XCTAssert(result == expcetd, "Hex was expected to be \(expcetd) but was \(result)")
    }
    
    func test_correcntColorReceived() {
        let expcetd = Color(hex: ColorName.rwGreen.rawValue)!
        var result:Color = .clear
        
        viewModel.$color
            .sink(receiveValue: { result = $0})
            .store(in: &subscriptions)
        
        viewModel.hexText = ColorName.rwGreen.rawValue
        
        XCTAssert(result == expcetd, "Color expected to be \(expcetd) but was \(result)")
    }
    
    func test_processBackspaceReceivesCorrectColor() {
        let expected = Color.white
        var result = Color.clear
        
        viewModel.$color
            .sink(receiveValue:  { result = $0})
            .store(in: &subscriptions)
        
        viewModel.process(CalculatorViewModel.Constant.backspace)
        
        XCTAssert(result == expected, "Hex was expected to be \(expected) but was \(result)")
    }
    
    func test_whiteColorReceivedForBadData() {
        let expected = Color.white
        var result = Color.clear
        
        viewModel.$color
            .sink(receiveValue: { result = $0 })
            .store(in: &subscriptions)
        
        viewModel.hexText = "abc"
        
        XCTAssert(result == expected, "Color expecetd to be \(expected) but was \(result)")
    }
    
    func test_process_Backspace_removeAll_of_hextext() {
        let expected = "#"
        var result = "abc"
        
        viewModel.$hexText
            .sink(receiveValue:  { result = $0})
            .store(in: &subscriptions)
        
        viewModel.process(CalculatorViewModel.Constant.clear)
        
        XCTAssert(result == expected, "Hex was expected to be \(expected) but was \(result)")
    }
    
    func test_correctRGBOTextReceived() {
        let expected = "0, 102, 54, 170"
        var result = ""
        
        viewModel.$rgboText
            .sink(receiveValue:  { result = $0 })
            .store(in: &subscriptions)
        
        viewModel.hexText = "#006636AA"
        
        XCTAssert(result == expected, "RGBO text expected to be \(expected) but was \(result)")
    }
}
