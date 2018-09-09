//
//  ViewController.swift
//  RxSwiftMac
//
//  Created by rhino Q on 09/09/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

import Cocoa
import RxSwift
import RxCocoa

class ViewController: NSViewController {
    
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var label: NSTextField!
    @IBOutlet weak var checkboxButton: NSButton!
    
    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var sliderValue: NSTextField!
    @IBOutlet weak var unbindButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sequence = Observable.of(1,2,3)
        _ = sequence
            .map { $0 * 2 }
            .subscribe { print( $0 ) }
        
        let checkboxSequence = checkboxButton.rx.state
        .observeOn(MainScheduler.instance)
        
        let textFieldSequence = textField.rx.text
            .observeOn(MainScheduler.instance)
        
        let result = Observable.combineLatest(textFieldSequence, checkboxSequence) { (text, state) -> String in
            if state == NSControl.StateValue.on {
                return text!
            } else {
                return "Disabled"
            }
        }
        
        let resultDisposable = result.bind(to: label.rx.text)
        disposeBag.insert(resultDisposable)
        
        // NSSilder example
        let sliderReulstDisposable = slider.rx.value.subscribe(onNext: { (value) in
            self.sliderValue.stringValue = "\(Int(value))"
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        
        disposeBag.insert(sliderReulstDisposable)
        
        let sliderValueDisposable = sliderValue.rx.text.subscribe(onNext: { (value) in
            let doubleValue = value?.toDouble() ?? 0.0
            self.slider.doubleValue = doubleValue
            self.sliderValue.stringValue = "\(Int(doubleValue))"
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        disposeBag.insert(sliderValueDisposable)
        
        // unbind everything
        let unbindButtonDisposable = unbindButton.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.disposeBag = DisposeBag()
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        disposeBag.insert(unbindButtonDisposable)
    }
}

extension String {
    func toDouble() -> Double? {
        let numberFormatter = NumberFormatter()
        return numberFormatter.number(from: self)?.doubleValue
    }
}
