//
//  PhotosViewController.swift
//  instagramTest
//
//  Created by Hao Wang on 2/4/15.
//  Copyright (c) 2015 Hao Wang. All rights reserved.
//

import UIKit

class PhotosViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    var photos : NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var clientId = "c4c3b788733446e3862219ad80f5a00f"
        self.tableView.rowHeight = 320
        var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            self.photos = responseDictionary["data"] as NSArray
            self.tableView.reloadData()
            
            
            println("response: \(self.photos)")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as PhotoDetailsViewController
        var indexPath = self.tableView.indexPathForCell(sender as UITableViewCell)
        if let indexPath1 = indexPath {
            vc.photo = self.photos[indexPath1.row] as NSDictionary
        }
        
    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = "row\(indexPath.row)"
        if ( self.photos.count > 0) {
            let imageDict = self.photos[indexPath.row] as NSDictionary
            let imageUrls = imageDict["images"] as NSDictionary
            let imageUrlObj = imageUrls["standard_resolution"] as NSDictionary
            let imageUrl = imageUrlObj["url"] as String

            cell.imageView?.setImageWithURL(NSURL(string: imageUrl))
            
        }
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
