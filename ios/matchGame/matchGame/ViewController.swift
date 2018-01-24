//
//  ViewController.swift
//  matchGame
//
//  Created by rhino Q on 2018. 1. 23..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = CardModel()
    var cardArray = [Card]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Call the getCards method of the card model
        cardArray = model.getCards()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

