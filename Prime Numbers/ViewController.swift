//
//  ViewController.swift
//  Prime Numbers
//
//  Created by Jason on 2/11/16.
//  Copyright © 2016 Salt Lake Community College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelCover: UILabel!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        numberTextField.text = "\(currentValue)"
    }
    
    var max = 1000
    var isPrime = true
    var primeArray: [Int] = []
    var buttonY = 0
    var buttonX = 0
    var timerCounter = 0
    var animSpeed = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up timer
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.03, target: self, selector: "update", userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.contentSize = CGSizeMake(50, CGFloat(max*20))
        
        for var i = 2; i <= max; i++ {
            
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
                //print("\(i) added to array.")
            }
            
            let numberButton = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: 50, height: 15))
            buttonY = buttonY + 20  // add spacing
            //buttonX = buttonX + 15
            
            
            numberButton.layer.cornerRadius = 5  // get some fancy pantsy rounding
            numberButton.backgroundColor = UIColor.lightGrayColor()
            numberButton.setTitle("\(i)", forState: UIControlState.Normal)
            numberButton.titleLabel?.text = "\(i)"
            //numberButton.addTarget(self, action: "villainButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
            
            //self.view.addSubview(numberButton)
            scrollView.addSubview(numberButton)
            
            //coordinate casting to CGFloat
            //scrollView.setContentOffset(CGPointMake(0, CGFloat(i+i)), animated: true)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        // Something cool
        scrollView.setContentOffset(CGPointMake(0, CGFloat(timerCounter*animSpeed)), animated: true)
        print("Timer: \(timerCounter)")
        timerCounter++


    }

}

