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

import XCTest
import Combine
import SwiftUI
@testable import ChuckNorrisJokesModel

final class JokesViewModelTests: XCTestCase {
    private lazy var testJoke = self.testJoke(forResource: "TestJoke")
    private lazy var testTranslatedJokeValue = self.testJoke(forResource: "TestTranslatedJoke").value.value
    private lazy var error = URLError(.badServerResponse)
    private var subscriptions = Set<AnyCancellable>()
    
    override func tearDown() {
        subscriptions = []
    }
    
    private func testJoke(forResource resource: String) -> (data: Data, value: Joke) {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: resource, withExtension: "json"),
              let  data = try? Data(contentsOf: url),
              let joke = try? JSONDecoder().decode(Joke.self, from: data)
        else { fatalError("Failed to load \(resource)") }
        
        return (data, joke)
    }
    
    
    
    func test_createJokesWithSampleJokeData() {
        // Given
        guard let url = Bundle.main.url(forResource: "SampleJoke", withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else { return XCTFail("SampleJoke file missing or data is corrupted") }
        
        let sampleJoke: Joke
        
        // When
        do {
            sampleJoke = try JSONDecoder().decode(Joke.self, from: data)
        } catch {
            return XCTFail(error.localizedDescription)
        }
        
        // Then
        XCTAssert(sampleJoke.categories.count == 1, "Sample joke categories.count was expected to be 1 but was \(sampleJoke.categories.count)")
        XCTAssert(sampleJoke.value == "Chuck Norris writes code that optimizes itself.", "First sample joke was expected to be \"Chuck Norris writes code that optimizes itself.\" but was \"\(sampleJoke.value)\"")
    }
    
    func test_backgroundColorFor50TranslationPercentIsGreen() {
        // Given
        let vm = self.viewModel()
        let translationPercent = 0.5
        let expected = Color("Green")
        var result:Color = .clear
        
        vm.$backgroudnColor
            .sink(receiveValue: {
                result = $0
            })
            .store(in: &subscriptions)
        
        // When
        vm.updateBackgroundColorForTranslation(translationPercent)
        
        // Then
        XCTAssertEqual(result,expected, "Color expected to be \(expected) but was \(result)")
        
    }
    
    func test_decisionStateFor60TranslationPercentIsLiked() {
        // Given
        let vm = self.viewModel()
        let translationPercentt = 0.6
        let bounds = CGRect(x: 0, y: 0, width: 414, height: 896)
        let x = bounds.width
        let expected: JokesViewModel.DecisionState = .liked
        var result: JokesViewModel.DecisionState = .undecided
        
        vm.$decisionState
            .sink(receiveValue:  {
                result = $0
            })
            .store(in: &subscriptions)
        
        
        // When
        vm.updateDecisionStateForTranslation(translationPercentt,
                                             andPredictedEndLocationX: x,
                                             inBounds:bounds)
        
        // Then
        XCTAssertEqual(result,expected, "Decision state expected to be \(expected) but was \(result)")
        
    }
    
    func test_decisionStateFor59TranslationPercentIsUndecided() {
        // Given
        let vm = self.viewModel()
        let translationPercentt = 0.59
        let bounds = CGRect(x: 0, y: 0, width: 414, height: 896)
        let x = bounds.width
        let expected: JokesViewModel.DecisionState = .undecided
        var result: JokesViewModel.DecisionState = .liked
        
        vm.$decisionState
            .sink(receiveValue:  {
                result = $0
            })
            .store(in: &subscriptions)
        
        
        // When
        vm.updateDecisionStateForTranslation(translationPercentt,
                                             andPredictedEndLocationX: x,
                                             inBounds:bounds)
        
        // Then
        XCTAssertEqual(result,expected, "Decision state expected to be \(expected) but was \(result)")
    }
    
    func test_fetchJokeSucceeds() {
        // Given
        let vm = viewModel()
        let expectation = self.expectation(description: #function)
        let expected = self.testJoke.value
        var result: Joke!
        
        vm.$joke
            .dropFirst()
            .sink(receiveValue:  {
                result = $0
                expectation.fulfill()
            })
            .store(in: &subscriptions)
        // When
        vm.fetchJoke()
        

        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(result,expected, "Joke expected expected to be \(expected) but was \(String(describing: result))")

        
    }
    
    func test_fetchJokeReceivesErrorJoke() {
        // Given
        let vm = viewModel(withJokeError: true)
        let expectation = self.expectation(description: #function)
        let expected = Joke.error
        var result: Joke!
        
        vm.$joke
            .dropFirst()
            .print("test_fetchJokeReceivesErrorJoke")
            .sink(receiveValue:  {
                result = $0
                print("test_fetchJokeReceivesErrorJoke receiveValue \($0)")
                expectation.fulfill()
            })
            .store(in: &subscriptions)
        // When
        vm.fetchJoke()
        

        wait(for: [expectation], timeout: 1)
        XCTAssert(result == expected, "Joke expected to be \(expected) but was \(String(describing: result))")
//        XCTAssertEqual(result,expected, "Joke expected expected to be \(expected) but was \(String(describing: result))")
        
    }
    
    private func mockJokesService(withError: Bool = false) ->  MockJokesService {
        MockJokesService(data: testJoke.data, error: withError ? error : nil)
    }
    
    private func viewModel(withJokeError jokeError: Bool = false) -> JokesViewModel {
        JokesViewModel(jokesService: mockJokesService(withError: jokeError))
    }
}
