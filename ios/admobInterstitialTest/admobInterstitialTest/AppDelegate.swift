//
//  AppDelegate.swift
//  admobInterstitialTest
//
//  Created by rhino Q on 26/12/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
// thanks to : http://blog.chopestory.net/307

import UIKit
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GADInterstitialDelegate {

    var window: UIWindow?
    var interstitial: GADInterstitial?
    var launchScreenView: UIView?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GADMobileAds.configure(withApplicationID: "ca-app-pub-3940256099942544~1458002511")
        
        if let view = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()?.view {
            launchScreenView = view
            view.translatesAutoresizingMaskIntoConstraints = false
            
            if let rootView = window?.rootViewController?.view {
                rootView.addSubview(view)
                
                var constraints = [NSLayoutConstraint]()
                constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: [], metrics: nil, views: ["view": view])
                constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: [], metrics: nil, views: ["view": view])
                rootView.addConstraints(constraints)
            }
        }
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial?.delegate = self
        
        let request = GADRequest()
        interstitial?.load(request)
        
        return true
    }
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial){
        guard let viewController = window?.rootViewController else { return }
        ad.present(fromRootViewController: viewController)
    }
    
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        launchScreenView?.removeFromSuperview()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

