//
//  ViewController.swift
//  IAPSample2
//
//  Created by cord7894 on 2017. 7. 8..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController, SKPaymentTransactionObserver, SKProductsRequestDelegate{
    @IBOutlet weak var consumeLabel: UILabel!
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var nonconsumeLabel: UILabel!
    @IBOutlet weak var premiumLabel: UILabel!
    
    @IBOutlet weak var btnBuy10Coins: UIButton!
    @IBOutlet weak var btnUnlockPremium: UIButton!
    @IBOutlet weak var btnRestorePuchase: UIButton!
    
    // 제품아이디
    let COINS_PI = "com.okdapp.IAPSample2.coins"
    let PREMIUM_PI = "com.okdapp.IAPSample2.premium"
    
    // 제품 아이디를 가질 임시변수
    var productID = " "
    
    // 제품을 담은 array
    var IAPProudcts = [SKProduct]()
    
    // coin
    var coins = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // transaction observer 등록
        SKPaymentQueue.default().add(self)
        
        // 상품정보 요청
        getProduts()
    }
    
    func getProduts(){
        // 인앱 결제 가능 여부 판단
        if SKPaymentQueue.canMakePayments(){
            // 상품정보요청
            let identifiers = Set([COINS_PI, PREMIUM_PI])
            let pr = SKProductsRequest(productIdentifiers: identifiers)
            // 상품이 로드되면 앱에 정보를 전달할 준비
            pr.delegate = self
            // 시작 productsRequest 자동 호출
            pr.start()
            
        } else {
            consumeLabel.text = "인앱결제 활성화를 해주세요"
        }
    }
    
    // 상품 정보 정상 수신시 자동 호출되는 함수
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        IAPProudcts = response.products
        if IAPProudcts.count > 0 {
            
            
            // 첫 번째 아이템에 대한 처리
            let firstP = IAPProudcts[0]
            
            let numberFormatter = NumberFormatter()
            numberFormatter.formatterBehavior = .behavior10_4
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = firstP.priceLocale
            let priceStr = numberFormatter.string(from: firstP.price)
            
            consumeLabel.text = firstP.localizedDescription + "\n \(priceStr!)"
            
            
            
            // 두 번째 아이템에 대한 처리
            let secondP = IAPProudcts[1]
            
            numberFormatter.locale = secondP.priceLocale
            let price2Str = numberFormatter.string(from: secondP.price)
            nonconsumeLabel.text = secondP.localizedDescription + "\n for just $\(price2Str!)"
            
            // 버튼 활성화
            btnBuy10Coins.isEnabled = true
            btnUnlockPremium.isEnabled = true
            btnRestorePuchase.isEnabled = true
            
        } else {
            consumeLabel.text = "아이템이 없거나 상품정보를 가져오는데 에러가 났습니다."
        }
        
        // 유효하지 않은 제품아이디 색출
        let invalidPL = response.invalidProductIdentifiers
        for invalidP in invalidPL{
            print("invalid : \(invalidP)")
        }
    }
    
    // 구매함수
    func purchaseProduct(product:SKProduct){
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
        productID = product.productIdentifier
    }

    // 소모성 구매함수
    @IBAction func buy10Coins(_ sender: UIButton) {
        purchaseProduct(product: IAPProudcts[0])
    }
    
    // 비 소모성 구매함수
    @IBAction func unlockPrimium(_ sender: UIButton) {
        purchaseProduct(product: IAPProudcts[1])
    }
    
    // 상품 결제 요청 후 자동으로 호출되는 함수
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for tran in transactions{
            switch tran.transactionState {
            case .purchased:
                print("purchased")
                if productID == COINS_PI {
                    coins += 10
                    coinLabel.text = "COINS : \(coins)"
                } else if productID == PREMIUM_PI {
                    premiumLabel.text = "Premium version purchased"
                }
                SKPaymentQueue.default().finishTransaction(tran)
                break
            case .failed:
                print("failed")
                SKPaymentQueue.default().finishTransaction(tran)
                break
            case .restored:
                print("restored")
                SKPaymentQueue.default().finishTransaction(tran)
                break
            case .deferred:
                print("deferred")
                break
            case .purchasing:
                print("purchasing")
                break
            }
        }
    }
    
    // resotre버튼
    @IBAction func restorePurchase(_ sender: UIButton) {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    // restore버튼누른 후 자동 호출 함수, UPdate UI or alert
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        if queue.transactions.count == 0
        {
            print("no purchase to resotre")
        }
        else {
            premiumLabel.text = " premium version restored"
        }
    }
}

