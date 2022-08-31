//
//  ViewController.swift
//  Leetcode
//
//  Created by BANKUM-BLRM20 on 15/02/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getMostWordsFound()
        getNumJewelsInStones()
    }
    
    private func getMostWordsFound() {
        let sentences = ["alice and bob love leetcode", "i think so too", "this is great thanks very much"]
        let val = mostWordsFound(sentences)
        print("mostWordsFound--", val)
    }
    
    private func getNumJewelsInStones() {
        let jewels = "aA", stones = "aAAbbbb"
        let val = numJewelsInStones(jewels, stones) //O(n^2)
        print("numJewelsInStones--", val)
        
        let val1 = numJewelsInStones2(jewels, stones)
        print("numJewelsInStones2--", val1)
    }

}

