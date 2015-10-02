//
//  ViewController.swift
//  MeineRezepte
//
//  Created by Thomas Karg on 02.10.15.
//  Copyright © 2015 Thomas Karg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var tableData = [Rezept]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let muesli = Rezept(rezeptName: "Müsli",
            dieZutaten: [
                ["name" : "Haferflocken", "menge" : "100g"],
                ["name" : "Nüsse", "menge" : "30g"]
            ])
        
        tableData.append(muesli)
        
        let pizza = Rezept(rezeptName: "Pizza",
            dieZutaten: [
                ["name" : "Haferflocken", "menge" : "100g"],
                ["name" : "Nüsse", "menge" : "30g"]
            ])
        
        tableData.append(pizza)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("receptRow")!
        
        cell.textLabel?.text = tableData[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let ctrl = segue.destinationViewController as! DetailController
        let indexPath = tableView.indexPathForSelectedRow
        let rezept = tableData[indexPath!.row]
        ctrl.currentRecipe = rezept
    }
    
    
}

