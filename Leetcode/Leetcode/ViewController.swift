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
//        getMostWordsFound()
//        getNumJewelsInStones()
        //getShuffleString()
        
        
        checkIsAnagram()
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

    
    private func getShuffleString() {
        let s = "codeleet", indices = [4,5,6,7,0,2,1,3]
        print("shuffleString--", shuffleString(s, indices))
        print("restoreString--", restoreString(s, indices))
    }
    
    private func checkIsAnagram() {
        let s = "anagram", t = "nagaram"
        print("isAnagram--", isAnagram(s, t))
       
    }
}

