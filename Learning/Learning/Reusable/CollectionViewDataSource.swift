//
//  CollectionViewDataSource.swift
//  Learning
//
//  Created by Jozsef Vesza on 10/06/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let cellConfigurator: CellConfiguratorDelegate
    var items: AnyObject[]
    weak var collectionView: UICollectionView?
    
    init(items: AnyObject[], collectionView: UICollectionView, cellConfigurator: CellConfiguratorDelegate) {
        self.items = items
        self.collectionView = collectionView
        self.cellConfigurator = cellConfigurator
        super.init()
        self.collectionView!.dataSource = self
    }
    
    func collectionView(collectionView: UICollectionView?, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        let itemAtIndex: AnyObject! = self.items[indexPath.row]
        var cell : AnyObject! = collectionView.dequeueReusableCellWithReuseIdentifier(self.cellConfigurator.fetchReuseIdentifierForCell(object: itemAtIndex), forIndexPath: indexPath)
        cell = self.cellConfigurator.configureCell(cell, usingObject: itemAtIndex)
        return cell as UICollectionViewCell
    }
}
