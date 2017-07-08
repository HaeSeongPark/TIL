//
//  ViewController.swift
//  okdappIAPSample
//
//  Created by cord7894 on 2017. 7. 7..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController, SKPaymentTransactionObserver, SKProductsRequestDelegate {

    @IBOutlet weak var consumeLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var nonconsumeLabel: UILabel!
    @IBOutlet weak var primiumLabel: UILabel!
    
    
    @IBOutlet weak var buy10coins: UIButton!
    @IBOutlet weak var unlockPrimum: UIButton!
    @IBOutlet weak var resotrePurchase: UIButton!
    
    let COINS_PRODUCT_ID = "com.okdapp.IAPSample.coins"
    let PREMIUM_PRODUCTS_ID = "com.okdapp.IAPSample.primium"
    
    var productID = ""
    var iapProducts = [SKProduct]()
    
    var coins = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        coinsLabel.text = "COINS : \(coins)"
        primiumLabel.text = "Premium version LOCKED!"
        
        // transaction observer를 등록
        SKPaymentQueue.default().add(self)
        
        // 상품정보요청함수
        getProductInfo()
    }
    
    // 상품 정보 요청 함수
    func getProductInfo() {
        // 인앱 결제가 가능한지 체크
        if SKPaymentQueue.canMakePayments(){
            // 상품정보 요청
            let productsIndentifirers = Set([COINS_PRODUCT_ID, PREMIUM_PRODUCTS_ID])
            let pr = SKProductsRequest(productIdentifiers: productsIndentifirers)
            // 상품이 로드되면 앱에 정보를 전달
            pr.delegate = self
            // productRequest호출
            pr.start()
        } else {
            consumeLabel.text = "인앱결제 활성화 부탁드립니다."
            nonconsumeLabel.text = "인앱결제 활성화 부탁드립니다."
        }
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        iapProducts = response.products
        // 상품 정보가 정상적으로 수신됐을 경우
        if iapProducts.count > 0 {
            // 첫 번째 제품 (consume)에 대한 처리
            let firstProduct = iapProducts[0]
            consumeLabel.text = firstProduct.localizedDescription + "\n $\(firstProduct.price)"
            
            // 두 번째 제품(non consume)에 대한 처리
            let secondProduct = iapProducts[1]
            primiumLabel.text = secondProduct.localizedDescription + "\n $\(secondProduct.price)"
            
            buy10coins.isEnabled = true
            unlockPrimum.isEnabled = true
            resotrePurchase.isEnabled = true
        } else {
            // 정보가 비정성 처리 됐을 때
            consumeLabel.text = "상품정보 비정상 처리"
            primiumLabel.text = "상품정보 비정상 처리"
        }
        
        let invalidProductList = response.invalidProductIdentifiers
        for invalidProduct in invalidProductList{
            print("product not found : \(invalidProduct)")
        }
    }
    
    // 구매 함수
    func pruchaseProudct(product:SKProduct) {
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
        productID = product.productIdentifier
    }
    
    @IBAction func buy10Coins(_ sender: UIButton) {
        pruchaseProudct(product: iapProducts[0])
    }
    
    @IBAction func unlockPrimium(_ sender: UIButton) {
        pruchaseProudct(product: iapProducts[1])
    }

    @IBAction func restorePurchase(_ sender: UIButton) {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    // restore버튼누른 후 자동 호출 함수, UPdate UI or alert
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue){
        if (queue.transactions.count == 0){
            print("no purchases to restore")
        }
        else{
            primiumLabel.text = "Premium version RESTORED!!!"
        }
    }
    
    // 상품 구매를 위해 결제 요청 후 자동으로 호출되는 함수
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transacion in transactions{
            switch transacion.transactionState {
            case .purchased:
                print("purchased")
                if productID == COINS_PRODUCT_ID {
                    coins += 10
                    coinsLabel.text = "COINS: \(coins)"
                } else if productID == PREMIUM_PRODUCTS_ID {
                    primiumLabel.text = "Premium version PURCHASED!"
                }
                SKPaymentQueue.default().finishTransaction(transacion)
                break
            case .failed:
                print("failed")
                SKPaymentQueue.default().finishTransaction(transacion)
                break
            case .restored:
                print("restored")
                SKPaymentQueue.default().finishTransaction(transacion)
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

