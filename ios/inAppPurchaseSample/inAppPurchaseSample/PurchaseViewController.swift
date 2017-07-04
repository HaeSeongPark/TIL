//
//  PurchaseViewController.swift
//  inAppPurchaseSample
//
//  Created by cord7894 on 2017. 7. 4..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit
import StoreKit

class PurchaseViewController: UIViewController, SKPaymentTransactionObserver, SKProductsRequestDelegate{

    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UITextField!
    @IBOutlet weak var purchase: UIButton!
    
    @IBAction func purchaseProduct(_ sender: UIButton) {
        let payment = SKPayment(product: product!)
        SKPaymentQueue.default().add(payment)
    }
    
    var product:SKProduct?
    var productID = "okdapp4321"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        purchase.isEnabled = false
        SKPaymentQueue.default().add(self)
        getProductInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getProductInfo(){
        if SKPaymentQueue.canMakePayments(){
            let request = SKProductsRequest(productIdentifiers: NSSet(object: self.productID) as! Set<String>)
            request.delegate = self
            request.start()
        }else{
            productDescription.text = "설정에서 인앱결제를 활성화주세요"
        }
        
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        var products = response.products
        // 상품 정보가 정상적으로 수신되었을 경우 화면에 상품 정보 갱신 및 구매 버튼 활성화 처리한다.
        if products.count != 0 {
            product = products[0] as SKProduct
            purchase.isEnabled = true
            productTitle.text = product!.localizedTitle
            productDescription.text = product!.localizedDescription
        }else{
            productTitle.text = "애플계정에 등록된 상품정보 확인불가"
        }
        
        let productList = response.invalidProductIdentifiers
        for productItem in productList{
            print("Product not found : \(productItem)")
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions as [SKPaymentTransaction]{
            switch transaction.transactionState {
            case SKPaymentTransactionState.purchased:
                // 구매가 정상적으로 완료될 경우 후처리 시작
                self.unlockFeature()
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case SKPaymentTransactionState.failed:
                SKPaymentQueue.default().finishTransaction(transaction)
            default: break
            }
        }
    }
    
    // 상품 구매가 완료되었을 경우 앱내 후처리(실제로는 구매번호, 구매일자등을 로컬에 저장해 둔다)
    func unlockFeature(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.mainViewController!.enableScreenButton()
        purchase.isEnabled = false
        productTitle.text = "상품 구매 완료되었습니다."
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
