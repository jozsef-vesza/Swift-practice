//
//  TableViewDataSource.swift
//  Learning
//
//  Created by Jozsef Vesza on 10/06/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    let cellConfigurator: CellConfiguratorDelegate
    var items: AnyObject[]
    weak var tableView: UITableView?
    
    init(items: AnyObject[], tableView: UITableView, cellConfigurator: CellConfiguratorDelegate) {
        self.items = items
        self.tableView = tableView
        self.cellConfigurator = cellConfigurator
        super.init()
        self.tableView!.dataSource = self
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let itemAtIndex : AnyObject! = self.items[indexPath.row]
        var cell : AnyObject! = tableView.dequeueReusableCellWithIdentifier(self.cellConfigurator.fetchReuseIdentifierForCell(object: itemAtIndex))
        cell = self.cellConfigurator.configureCell(cell, usingObject: itemAtIndex)
        return cell as UITableViewCell
    }
    
}
