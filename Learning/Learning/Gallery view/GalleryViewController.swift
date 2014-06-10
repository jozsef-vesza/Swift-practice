//
//  GalleryViewController.swift
//  Learning
//
//  Created by Jozsef Vesza on 04/06/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

class GalleryViewController: UICollectionViewController {
    
    var viewModel: GalleryViewModel?
    var dataSource: CollectionViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = CollectionViewDataSource(items: self.viewModel!.model, collectionView: self.collectionView, cellConfigurator: GalleryCellConfigurator())
        
        NSNotificationCenter.defaultCenter().addObserverForName(imageNotification, object: self.viewModel, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification: NSNotification!) -> Void in
                var indexFromNotification = notification.userInfo["index"] as Int
                var indexPathForCollectionView = NSIndexPath(forItem: indexFromNotification, inSection: 0)
                self.collectionView.reloadItemsAtIndexPaths([indexPathForCollectionView])
            })
    }
}
