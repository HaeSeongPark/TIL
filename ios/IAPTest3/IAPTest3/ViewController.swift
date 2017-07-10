//
//  ViewController.swift
//  IAPTest3
//
//  Created by cord7894 on 2017. 7. 9..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController, SKPaymentTransactionObserver, SKProductsRequestDelegate {

    @IBOutlet weak var consumeLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var nonConsumeLabel: UILabel!
    @IBOutlet weak var premiumLabel: UILabel!
    
    @IBOutlet weak var btnBuy10Coins: UIButton!
    @IBOutlet weak var btnUnlockPremium: UIButton!
    @IBOutlet weak var btnRestorePremium: UIButton!
    
    let COINS_PI = "con.okdapp.IAPSample3.coins"
    let PREMIUM_PI = "con.okdapp.IAPSample3.premiu"
    
    var productId = " "
    
    var IAPProducts = [SKProduct]()
    
    var coins = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SKPaymentQueue.default().add(self)
        
        getProducts()
    }
    
    func getProducts(){
        if SKPaymentQueue.canMakePayments(){
            // 인앱 결제 가능 하면
            // 상품정보 가져온다.
            let identifiers = Set([COINS_PI, PREMIUM_PI])
            let pr = SKProductsRequest(productIdentifiers: identifiers)
            pr.delegate = self
            pr.start()
        } else {
            // 불가능ㅎ ㅏ면
            consumeLabel.text = "인앱 결제를 활성화 해주세요"
        }
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        IAPProducts = response.products
        if IAPProducts.count > 0 {
            let firstP = IAPProducts[0]
            consumeLabel.text = firstP.localizedDescription + "\n for just $\(firstP.price)"
            
            let secondP = IAPProducts[1]
            consumeLabel.text = secondP.localizedDescription + "\n for just $\(secondP.price)"
            
            btnBuy10Coins.isEnabled = true
            btnUnlockPremium.isEnabled = true
            btnRestorePremium.isEnabled = true
        } else {
            consumeLabel.text = "아이템이 없습니다."
        }
        
        let invalidPL = response.invalidProductIdentifiers
        for invaliP in invalidPL
        {
            print("invalid : \(invaliP)")
        }
    }
    
    func purchaseProducts(product:SKProduct){
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
        productId = product.productIdentifier
    }
    
    @IBAction func buy10Coins(_ sender: UIButton) {
        purchaseProducts(product: IAPProducts[0])
    }

    @IBAction func unlockPremium(_ sender: UIButton) {
        purchaseProducts(product: IAPProducts[1])

    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for tran in transactions{
            switch tran.transactionState {
            case .purchased:
                if productId == COINS_PI {
                    coins += 10
                    coinsLabel.text = "Coins : \(coins)"
                } else if proudctId == PREMIUM_PI {
                    premiumLabel.text = 프리미엄 법전이 구입돼습니다.
                }
            default:
                break
            }
        }
    }
    
    @IBAction func restorePremium(_ sender: UIButton) {
    }
    


}

