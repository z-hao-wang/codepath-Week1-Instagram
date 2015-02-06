//
//  PhotoDetailsViewController.swift
//  instagramTest
//
//  Created by Hao Wang on 2/4/15.
//  Copyright (c) 2015 Hao Wang. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var photoViewBig: UIImageView!
    var photo : NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageUrls = self.photo?["images"] as NSDictionary
        let imageUrlObj = imageUrls["standard_resolution"] as NSDictionary
        let imageUrl = imageUrlObj["url"] as String
        
        photoViewBig.setImageWithURL(NSURL(string: imageUrl))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
