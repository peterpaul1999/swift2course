//
//  PhotogridController.swift
//  ImageViewer
//
//  Created by Thomas Karg on 02.10.15.
//  Copyright © 2015 Thomas Karg. All rights reserved.
//

import UIKit

class PhotogridController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var fotos = [myFoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let comment = "Was für ein Urlaub"
        
        let bild1 = myFoto(bildName: "bagels_big", title: "Toller Urlaub", kommentar: comment)
        fotos.append(bild1)
        let bild2 = myFoto(bildName: "chickenfinger_big", title: "Toller Strand", kommentar: comment)
        fotos.append(bild2)
        let bild3 = myFoto(bildName: "macarons_big", title: "Unter Palmen", kommentar: comment)
        fotos.append(bild3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            let destCtrl = segue.destinationViewController as! DetailController
            let indexPath = sender as! NSIndexPath
            let myPhoto = fotos[indexPath.row]
            destCtrl.currentImage = myPhoto
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(fotos.count)
        return fotos.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("fotoCell", forIndexPath: indexPath) as! PhotogridCell
    
        // Configure the cell
        cell.backgroundColor = UIColor.grayColor()
        let currentImage = UIImage(named: fotos[indexPath.row].bildName)
        cell.imageView.image = currentImage
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */


    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        self.performSegueWithIdentifier("showDetail", sender: indexPath)
        return true
    }

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var size = CGSize(width: 100, height: 100)
        
        
        return size
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
    }

}
