//
//  ViewController.swift
//  practiceIAP
//
//  Created by cord7894 on 2017. 7. 6..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    @IBOutlet weak var consumeLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var nonConsumLabel: UILabel!
    @IBOutlet weak var premiumLabel: UILabel!
    
    @IBOutlet weak var btnBuy10coins: UIButton!
    @IBOutlet weak var btnUnlockPremium: UIButton!
    @IBOutlet weak var btnRestorePurchase: UIButton!
    

    let COINS_PRODUCT_ID = "com.rhino.practiceIAP4321.conis"
    let PREMIUM_PRODUCT_ID = "com.rhino.practiceIAP4321.primium"
    
    var productID = ""
    var iapProducts = [SKProduct]()
    var nonConsumablePurchaseMade = UserDefaults.standard.bool(forKey: "nonConsumablePurchaseMade")
    var coins = UserDefaults.standard.integer(forKey: "coins")
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check your In-App Purchases
        print("NON CONSUMABLE PURCHASE MADE: \(nonConsumablePurchaseMade)")
        print("COINS: \(coins)")
        
        // Set text
        coinsLabel.text = "COINS: \(coins)"
        
        if nonConsumablePurchaseMade{
            premiumLabel.text = "Premium version PURCHASED!"
        } else {
            premiumLabel.text = "Premium version LOCKED!"
        }
        
        // transaction observer를 등록
        SKPaymentQueue.default().add(self)

        // get  IAP Products available
        getProductInfo()
    }
    
    // 상품 정보 요청 함수
    func getProductInfo() {
        // 인앱 결제가 가능 하면, 애플에 상품 정보 요청, 요청이 완료되면 productRequest함수가 자동 호출
        if SKPaymentQueue.canMakePayments(){
            let productIndentifiers = Set([COINS_PRODUCT_ID, PREMIUM_PRODUCT_ID])
            let productsRequest = SKProductsRequest(productIdentifiers: productIndentifiers)
            productsRequest.delegate = self
            productsRequest.start()
        } else {
            consumeLabel.text = "설정에서 인앱결제를 활성화해주세요"
            nonConsumLabel.text = "설정에서 인앱결제를 활정화해주세요"
        }
    }
    
    // 상품 정보 수신 관련 함수
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        iapProducts = response.products
        // 상품 정보가 정상적으로 수신되었을 경우 화면에 상품 정보 갱신 및 구매 버튼 활성화 처리한다.
        if iapProducts.count > 0 {
            // 첫 번째 제품(consume)에 대한 처리
            let firstProudct = iapProducts[0] as SKProduct
            consumeLabel.text = firstProudct.localizedDescription + "\n for just $\(firstProudct.price)"
            
            // 두 번째 제품(non-consume)에 대한 처리
            let secondProudct = iapProducts[1] as SKProduct
            nonConsumLabel.text = secondProudct.localizedDescription + "\n for just $\(secondProudct.price)"
            
            // 상품 정보가 잘 왔으니 버튼 활성화
            btnBuy10coins.isEnabled = true
            btnUnlockPremium.isEnabled = true
            btnRestorePurchase.isEnabled = true
            
        } else {
            consumeLabel.text = "애플계정에 등록된 상품정보 확인불가"
            nonConsumLabel.text = "애플계정에 등록된 상품정보 확인불가"
        }
        
        let invalidProudctsList = response.invalidProductIdentifiers
        for invalidProudctItem in invalidProudctsList{
            print("Product not found : \(invalidProudctItem)")
        }
    }
    
    func purchaseMyProduct(product:SKProduct){
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
        productID = product.productIdentifier
    }
    
    @IBAction func buy10coinsBtn(_ sender: UIButton) {
        purchaseMyProduct(product: iapProducts[0])
    }
    
    @IBAction func unlockPremium(_ sender: UIButton) {
         purchaseMyProduct(product: iapProducts[1])
    }
    
    @IBAction func restorePurchaseBtn(_ sender: UIButton) {
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        if (queue.transactions.count == 0){
            print("no purchases to restore")
        } else {
            nonConsumablePurchaseMade = true
            UserDefaults.standard.set(nonConsumablePurchaseMade, forKey: "nonConsumablePurchaseMade")
            premiumLabel.text = "Premium version RESTORED!"
        }
    }
    
    // 상품 구매를 위해 결제 요청 후 자동으로 호출되는 함수
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions as [SKPaymentTransaction]{
            switch transaction.transactionState {
            case .purchased:
                print("purchased")
                SKPaymentQueue.default().finishTransaction(transaction)
                if productID == COINS_PRODUCT_ID {
                    coins += 10
                    UserDefaults.standard.set(coins, forKey: "coins")
                    coinsLabel.text = "COINS: \(coins)"
                } else if productID == PREMIUM_PRODUCT_ID{
                    nonConsumablePurchaseMade = true
                    UserDefaults.standard.set(nonConsumablePurchaseMade, forKey: "nonConsumablePurchaseMade")
                    premiumLabel.text = "Premium version PURCHASED!"
                }
                break
            case .failed:
                print("failed")
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .restored:
                print("restored")
                SKPaymentQueue.default().finishTransaction(transaction)
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
}

