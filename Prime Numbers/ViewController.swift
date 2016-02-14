//
//  ViewController.swift
//  Prime Numbers
//
//  Created by Jason on 2/11/16.
//  Copyright © 2016 Salt Lake Community College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //outlet declarations
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelCover: UILabel!
    @IBOutlet weak var primeScrollView: UIScrollView!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var primeCounterLabel: UILabel!
    
    //class variable declaraytion and initialization
    var maxNumber = 300;
    var isPrime = true
    var primeArray: [Int] = []
    var buttonY = 0
    var primeButtonY = 0
    var buttonX = 0
    var timerCounter = 0
    var primeCounter = 0
    var animSpeed = 10
    var goPressed = false
    
    @IBAction func goButton(sender: AnyObject) {
        //set up timer
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.03, target: self, selector: "update", userInfo: nil, repeats: true)
        
        timerCounter = 0;
        isPrime = true
        var primeArray: [Int] = []
        buttonY = 0
        primeButtonY = 0
        buttonX = 0
        timerCounter = 0
        primeCounter = 0
    
        scrollView.contentSize = CGSizeMake(50, CGFloat(maxNumber*20))
        primeScrollView.contentSize = CGSizeMake(50, CGFloat(maxNumber*20))
        
        
        for var i = 2; i <= maxNumber; i++ {
            
            //reset isPrime flag
            isPrime = true;
            
            for (index, number) in primeArray.enumerate() {
                
                if i % number == 0 {
                    isPrime = false
                }
                //print("index: \(index)")
            }
            
            if(isPrime) {
                primeArray.append(i)
                primeCounter++
                print("\(i) added to array.")
                
            }
            
            //adding all numbers
            let numberButton = UIButton(frame: CGRect(x: buttonX, y:buttonY, width: 50, height: 15))
            buttonY = buttonY + 20  // add spacing
            numberButton.layer.cornerRadius = 5  // get some fancy pantsy rounding
            numberButton.backgroundColor = UIColor.lightGrayColor()
            numberButton.setTitle("\(i)", forState: UIControlState.Normal)
            numberButton.titleLabel?.text = "\(i)"
            
            scrollView.addSubview(numberButton)
            
        }
        
        for (index, number) in primeArray.enumerate() {
            //adding primes only
            let primeNumberButton = UIButton(frame: CGRect(x: buttonX, y:primeButtonY, width: 50, height: 15))
            primeButtonY = primeButtonY + 20  // add spacing
            primeNumberButton.layer.cornerRadius = 5  // get some fancy pantsy rounding
            primeNumberButton.backgroundColor = UIColor.redColor()
            primeNumberButton.setTitle("\(number)", forState: UIControlState.Normal)
            primeNumberButton.titleLabel?.text = "\(number)"
            primeScrollView.addSubview(primeNumberButton)
        }

    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        numberTextField.text = "\(currentValue)"
        maxNumber = currentValue
        print("maxNumber: \(maxNumber)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        // Something cool
        let scrollY = CGFloat(timerCounter*animSpeed*2)
        let primeScrollY = CGFloat(timerCounter*animSpeed/2)

        if Int(scrollY) < buttonY-250 {
            scrollView.setContentOffset(CGPointMake(0, scrollY), animated: true)
        }
        if Int(primeScrollY) < primeButtonY-250 {
            primeScrollView.setContentOffset(CGPointMake(0, primeScrollY), animated: true)
        } else {
            primeCounterLabel.text = "There are \(primeCounter) primes between 2 and \(maxNumber)!"
        }
        
        print("primeButtonY: \(primeButtonY)")
        print("primeScrollY: \(primeScrollY)")
        
        print("timerCounter: \(timerCounter)")
        

        
        timerCounter++

    }

}

