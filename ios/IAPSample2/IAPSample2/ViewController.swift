//
//  ViewController.swift
//  IAPSample2
//
//  Created by cord7894 on 2017. 7. 8..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    @IBOutlet weak var consumeLabel: UILabel!
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var nonconsumeLabel: UILabel!
    @IBOutlet weak var premiumLabel: UILabel!
    
    @IBOutlet weak var btnBuy10Coins: UIButton!
    @IBOutlet weak var btnUnlockPremium: UIButton!
    @IBOutlet weak var btnRestorePuchase: UIButton!
    
    let CONIS_PI = "com.okdapp.IAPSample2.coins"
    let PREMIUM_PI = "com.okdapp.IAPSample2.premium"
    
    var productID = ""
    
    var iapProducts = [SKProduct]()
    
    var coins = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SKPaymentQueue.default().add(self)
        
        getProductInfo()
    }

    func getProductInfo(){
        if SKPaymentQueue.canMakePayments(){
            let productIDs = Set([CONIS_PI, PREMIUM_PI])
            let pr = SKProductsRequest(productIdentifiers: productIDs)
            pr.delegate = self
            pr.start()
        } else {
            consumeLabel.text = "인앱 결제를 해주세요"
        }
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse){
        iapProducts = response.products
        if iapProducts.count > 0 {
            let firstP = iapProducts[0]
            consumeLabel.text = firstP.localizedDescription + "\n for just \(firstP.price)"
            
            let secondP = iapProducts[1]
            nonconsumeLabel.text = secondP.localizedDescription + "\n for just \(secondP.price)"
            
            btnBuy10Coins.isEnabled = true
            btnUnlockPremium.isEnabled = true
            btnRestorePuchase.isEnabled = true
        } else {
            consumeLabel.text = "상품이 없습니다."
        }
        let invalidProductList  = response.invalidProductIdentifiers
        for invallidP in invalidProductList{
            print("invalidP: \(invallidP)")
        }
    }
    
    func purchaseProudct(product:SKProduct){
        let payment = SKPayment(product:product)
        SKPaymentQueue.default().add(payment)
        productID = product.productIdentifier
    }
    
    @IBAction func but10coins(_ sender: UIButton) {
        purchaseProudct(product: iapProducts[0])
    }
    
    @IBAction func unlockPremium(_ sender: UIButton) {
        purchaseProudct(product: iapProducts[1])
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions:[SKPaymentTransaction]) {
        for transaction in transactions{
            switch transaction.transactionState {
            case .purchased:
                print("pruchased")
                if productID == CONIS_PI{
                    coins += 10
                    coinLabel.text = "COINS : \(coins)"
                } else if productID == PREMIUM_PI {
                    premiumLabel.text = "Premium version Purchased"
                }
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .failed:
                print("failed")
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case.deferred:
                print("deferred")
                break
            case.purchasing:
                print("purchasing")
                break
            case.restored:
                print("restored")
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            }
        }
    }
    
    @IBAction func resotrePurchase(_ sender: UIButton) {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        if queue.transactions.count == 0{
            print("no purchase to restore")
        }  else {
            premiumLabel.text = "Premium version restored"
        }
    }
}

