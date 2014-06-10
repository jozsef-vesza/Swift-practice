//
//  GalleryCell.swift
//  Learning
//
//  Created by Jozsef Vesza on 04/06/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

let startAnimNotification = "startanim"
let stopAnimNotification = "stopanim"

class GalleryCell: UICollectionViewCell, DownloaderCell {
    @IBOutlet var mealImage : UIImageView
    @IBOutlet var downloadIndicator : UIActivityIndicatorView
    
    var mealName: String?
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "startAnimating:", name: startAnimNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "stopAnimating:", name: stopAnimNotification, object: nil)
    }
    
    func startAnimating(notification: NSNotification) {
        if notification.userInfo["meal"] as NSString == self.mealName {
            self.downloadIndicator.startAnimating()
        }
        
    }
    
    func stopAnimating(notification: NSNotification) {
        if notification.userInfo["meal"] as NSString == self.mealName {
            self.downloadIndicator.stopAnimating()
        }
    }
}
