//
//  DetailController.swift
//  ImageViewer
//
//  Created by Thomas Karg on 02.10.15.
//  Copyright © 2015 Thomas Karg. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    var currentImage: myFoto?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let img = UIImage(named: currentImage!.bildName)
        imageView.image = img
        titleLabel.text! = currentImage!.title
        commentLabel.text! = currentImage!.kommentar
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
