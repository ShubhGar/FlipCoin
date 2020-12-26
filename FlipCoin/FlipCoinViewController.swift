//
//  ViewController.swift
//  FlipCoin
//
//  Created by shubham Garg on 09/06/20.
//  Copyright © 2020 shubham Garg. All rights reserved.
//

import UIKit

class FlipCoinViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func headBtnAxn(_ sender: Any) {
        //check for head
        checkWinner(isHeadSelect: true)
    }
    
    @IBAction func tailBtnAxn(_ sender: Any) {
        //check for tail
        checkWinner(isHeadSelect: false)
    }
    
    
    func checkWinner(isHeadSelect: Bool){
        // flip the coin
        // random between [0,1]
        let random = Int.random(in: 0..<2)
        //0->Head
        //1-> tail
        if random == 0 {
            self.resultLabel.text = "Result: Head"
        }
        else{
            self.resultLabel.text = "Result: Tail"
        }
        //Int -> Bool
        //0 -> false
        //1 -> true
        if Bool(exactly: NSNumber(value: random)) != isHeadSelect {
            showAlert(title: "You Won")
        }
        else{
            showAlert(title: "You Lose")
        }
        
    }
    
    func showAlert(title: String){
        //create an alert
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        // add action on alert
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
            self.cleanUP()
        }))
        // present alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func cleanUP(){
        self.resultLabel.text = "Result:"
    }
}

