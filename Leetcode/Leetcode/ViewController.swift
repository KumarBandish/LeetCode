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
    }
    
    private func getMostWordsFound() {
        let sentences = ["alice and bob love leetcode", "i think so too", "this is great thanks very much"]
        let val = mostWordsFound(sentences)
        print("mostWordsFound--", val)
    }

}

