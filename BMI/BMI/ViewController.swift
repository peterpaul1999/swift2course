//
//  ViewController.swift
//  BMI
//
//  Created by Thomas Karg on 02.10.15.
//  Copyright © 2015 Thomas Karg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var kgField: UITextField!
    @IBOutlet var cmField: UITextField!
    @IBOutlet var kgSider: UISlider!
    @IBOutlet var cmSlider: UISlider!
    @IBOutlet var outputLabel: UILabel!
    
    @IBAction func calculateTapped(sender: AnyObject) {
        
        let kgValue = Int(kgField.text!)
        let cmValue = Int(cmField.text!)
        
        var output: String?
        
        if kgValue != nil && cmValue != nil {
            let sizeInMeter = Double(cmValue!) / 100
            let bmi = Int(Double(kgValue!) / (sizeInMeter * sizeInMeter))
            
            output = "Dein BMI: \(bmi)"
        } else {
            output = "CM oder KG nicht lesbar"
        }
        
        if output != nil {
            outputLabel.hidden = false
            outputLabel.text = output
        }
    }
    
    @IBAction func kgSet(sender: AnyObject) {
        kgField.text = "\(Int(kgSider.value))"
    }
    
    @IBAction func reset(sender: AnyObject) {
        kgField.text = "70"
        cmField.text = "170"
        kgSider.value = 70
        cmSlider.value = 170
        outputLabel.text = "Ergebnis"
        outputLabel.hidden = true
    }
    
    @IBAction func cmSet(sender: AnyObject) {
        cmField.text = "\(Int(cmSlider.value))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

