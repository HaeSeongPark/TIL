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
    
    var product:SKProduct!
    var productID = "com.rhino.inAppPurchaseSample.consume"  // 제품아이디
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         제품 정보 수신후 사용자에게 표시할때까지 아이템 구매 버튼은 비활성화되어있어야 한다.
         또한 이 클래스를 결제 작업을 위한 트랜잭션 감시자(transaction observer)로 설정해야 한다.
         그후에는 결제를 위한 제품 정보를 얻어서 사용자에게 표시하는 메서드를 최초로 호출해야 한다.
         */

        purchase.isEnabled = false // 상품 정보 수신전까지는 구매버튼 비활성화처리
        SKPaymentQueue.default().add(self)
        getProductInfo()
    }
    
    // 상품 정보 요청 함수
    func getProductInfo(){
        if SKPaymentQueue.canMakePayments(){
            // 애플에 상품 정보 요청, 요청이 완료되면 바로 아래 함수인 productsRequest함수가 자동 호출된다.
            let productIndeifiers = Set([productID])
            let request = SKProductsRequest(productIdentifiers: productIndeifiers)
            request.delegate = self
            request.start()
        }else{
            productDescription.text = "설정에서 인앱결제를 활성화주세요"
        }
    }

    
     // 상품 정보 수신 관련 delegate함수
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        var products = response.products
        // 상품 정보가 정상적으로 수신되었을 경우 화면에 상품 정보 갱신 및 구매 버튼 활성화 처리한다.
        if products.count > 0 {
            product = products[0] as SKProduct
            productTitle.text = product.localizedTitle
            productDescription.text = "\(product.localizedDescription)" + "$\(product.price)"
            purchase.isEnabled = true
        }else{
            productTitle.text = "애플계정에 등록된 상품정보 확인불가"
        }
        
        let productList = response.invalidProductIdentifiers
        for productItem in productList{
            print("Product not found : \(productItem)")
        }
    }
    
    @IBAction func purchaseProduct(_ sender: UIButton) {
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }

    // 상품 구매를 위해 결제 요청후 자동으로 호출되는 delegate함수
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions as [SKPaymentTransaction]{
            switch transaction.transactionState {
            case .purchased:
                // 구매가 정상적으로 완료될 경우 후처리 시작
                self.unlockFeature()
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
//            case .deferred: break  // 지연된 구입?
//            case .purchasing:break
//            case .restored:break
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
