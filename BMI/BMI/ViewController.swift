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
    }
    
    @IBAction func kgSet(sender: AnyObject) {
    }
    
    
    @IBAction func cmSet(sender: AnyObject) {
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

