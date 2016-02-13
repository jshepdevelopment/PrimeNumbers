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
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        counterLabel.text = "\(currentValue)"
    }
    
    var max = 100
    var isPrime = true
    var primeArray: [Int] = []
    var buttonY = 0
    var buttonX = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                print("\(i) added to array.")
            }
            
            let numberButton = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: 50, height: 15))
            buttonY = buttonY + 20  // add spacing
            //buttonX = buttonX + 15
            
            
            numberButton.layer.cornerRadius = 5  // get some fancy pantsy rounding
            numberButton.backgroundColor = UIColor.darkGrayColor()
            numberButton.setTitle("\(i)", forState: UIControlState.Normal)
            numberButton.titleLabel?.text = "\(i)"
            //numberButton.addTarget(self, action: "villainButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
            
            //self.view.addSubview(numberButton)
            scrollView.addSubview(numberButton)
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

