//
//  ViewController.swift
//  SynonyMaster
//
//  Created by Thomas Karg on 03.10.15.
//  Copyright © 2015 Thomas Karg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var synonyme = [String](){
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    
    @IBAction func goTapped(sender: AnyObject) {
        let searchTerm = searchField.text
        getSynonyms(searchTerm!)
    }
    
    func getSynonyms(forString: String){
        
        fetchSynonyms(forString) {
            (jsonDictionary) in
            var foundSynonyms = [String]()
            let termsList = jsonDictionary["synsets"] as! NSArray
            for synsetData in termsList {
                let currentSet = synsetData as! NSDictionary
                for currentTerm in currentSet["terms"] as! NSArray {
                    let term = currentTerm as! NSDictionary
                    foundSynonyms.append(term["term"] as! String)
                }
            }
            self.synonyme = foundSynonyms
        }
    }
    
    func fetchSynonyms(forString:String, callMe: (jsonDictonary: NSDictionary) -> Void) {
       
        let apiUrl = NSURL(string:"http://www.openthesaurus.de/synonyme/search?q=\(forString)&format=application/json")
        let request = NSURLRequest(URL:apiUrl!)
        NSURLSession.sharedSession().dataTaskWithRequest(request) {
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
        
            do {
                let jsonDict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
                dispatch_async(dispatch_get_main_queue()) {
                    callMe(jsonDictonary: jsonDict)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("synonymCell")
        
        cell?.textLabel!.text = synonyme[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return synonyme.count
    }

}

