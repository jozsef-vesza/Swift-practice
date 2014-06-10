//
//  MainCellConfigurator.swift
//  Learning
//
//  Created by Jozsef Vesza on 03/06/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

class MainCellConfigurator: NSObject, CellConfiguratorDelegate {
    
    func fetchReuseIdentifierForCell(object usingObject: AnyObject) -> String {
        return "mainCell"
    }
    
    func configureCell(cell: AnyObject, usingObject object: AnyObject) -> AnyObject {
        let returnCell: UITableViewCell = cell as UITableViewCell
        let meal = object as Meal
        returnCell.text = meal.name
        return cell
    }
}
