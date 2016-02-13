//
//  ViewController.swift
//  Prime Numbers
//
//  Created by Mac on 2/11/16.
//  Copyright © 2016 Salt Lake Community College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var max = 100
    var isPrime = true
    var primeArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for var i = 2; i <= max; i++ {
            
            //reset isPrime flag
            isPrime = true;
            
            for (index, number) in primeArray.enumerate() {
                
                if i % number.integerValue == 0 {
                    isPrime = false
                }
                
                print("Found \(number) at position \(index)")
                print("Loop counter: \(i-2)")
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

