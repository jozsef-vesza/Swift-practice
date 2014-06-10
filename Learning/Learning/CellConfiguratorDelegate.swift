//
//  CellConfiguratorDelegate.swift
//  Learning
//
//  Created by Jozsef Vesza on 03/06/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import Foundation

protocol CellConfiguratorDelegate {
    func fetchReuseIdentifierForCell(object usingObject: AnyObject) -> String
    func configureCell(cell: AnyObject, usingObject object: AnyObject) -> AnyObject
}
