//
//  FruitsReactor.swift
//  ReactorKitTest
//
//  Created by rhino Q on 2022/11/01.
//

import Foundation
import ReactorKit

final class FruitsReactor:Reactor {
    
    enum Action {
        case apple
        case banana
        case grapes
    }
    
    struct State {
        var fruitName:String
        var isLoading:Bool
    }
    
    enum Mutation {
        case changeLabelApple
        case changeLabelBanana
        case changeLabelGrapes
        case setLoading(Bool)
    }
    
    let initialState: State
    
    init() {
        self.initialState = State(fruitName: "선택된 과일 없습", isLoading: false)
    }
    
    // Action -> Mutation
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .apple:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                Observable.just(Mutation.changeLabelApple).delay(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false))
            ])
        case .banana:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                Observable.just(Mutation.changeLabelBanana).delay(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false))
            ])
        case .grapes:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                Observable.just(Mutation.changeLabelGrapes).delay(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .changeLabelApple:
            state.fruitName = "사과"
        case .changeLabelGrapes:
            state.fruitName = "포도"
        case .changeLabelBanana:
            state.fruitName = "바나나"
        case .setLoading(let isLoading):
            state.isLoading = isLoading
        }
        
        return state
    }
}
