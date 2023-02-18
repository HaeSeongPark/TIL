//
//  HeadingViewController.swift
//  UIKit-Combine
//
//  Created by Joseph Heck on 7/15/19.
//  Copyright © 2019 SwiftUI-Notes. All rights reserved.
//

import Combine
import CoreLocation
import UIKit

class HeadingViewController: UIViewController {
    let coreLocationProxy = LocationHeadingProxy()
    var headingBackgroundQueue: DispatchQueue = .init(label: "headingBackgroundQueue")
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - lifecycle methods
    
    @IBOutlet var permissionButton: UIButton!
    @IBOutlet var activateTrackingSwitch: UISwitch!
    @IBOutlet var headingLabel: UILabel!
    @IBOutlet var locationPermissionLabel: UILabel!
    
    @IBAction func requestPermission(_: UIButton) {
        self.coreLocationProxy.mgr.requestWhenInUseAuthorization()
    }
    
    @IBAction func trackingToggled(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            coreLocationProxy.enable()
            print("Enabling heading tracking")
        case false:
            coreLocationProxy.disable()
            print("Disabling heading tracking")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreLocationProxy.authPublisher
            .map { authorizationStatus -> String in
                switch authorizationStatus {
                case .authorizedWhenInUse:
                    return "Allowed when in use"
                case .notDetermined:
                    return "notDetermined"
                case .restricted:
                    return "restricted"
                case .denied:
                    return "denied"
                case .authorizedAlways:
                    return "authorizedAlways"
                @unknown default:
                    return "unknown default"
                }
            }
            .assign(to: \.text, on: locationPermissionLabel)
            .store(in: &cancellables)
        
        coreLocationProxy
            .publisher
            .print("headingSubscriber")
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { someValue in
                print("String(someValue.trueHeading) \(String(someValue.trueHeading))")
                self.headingLabel.text = String(someValue.trueHeading)
            })
            .store(in: &cancellables)
    }
}
