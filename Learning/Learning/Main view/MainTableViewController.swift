//
//  MainTableViewController.swift
//  Learning
//
//  Created by Jozsef Vesza on 03/06/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var viewModel: MainViewModel?
    var dataSource: TableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserverForName(notification, object: self.viewModel, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification: NSNotification!) -> Void in
            self.dataSource = TableViewDataSource(items: self.viewModel!.model, tableView: self.tableView, cellConfigurator: MainCellConfigurator())
            self.tableView.reloadData()
            })
    }
    
    @IBAction func galleryButtonPressed(sender : AnyObject) {
        self.performSegueWithIdentifier("showGallerySeque", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "showGallerySeque" {
            let nextViewModel = GalleryViewModel(viewController: segue.destinationViewController as UIViewController, model: self.viewModel!.mealsWithImages())
        }
    }
    
}
