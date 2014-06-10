//
//  DownloaderCell.swift
//  Learning
//
//  Created by Jozsef Vesza on 10/06/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import Foundation

protocol DownloaderCell {
    func startAnimating(notification: NSNotification) -> Void
    func stopAnimating(notification: NSNotification) -> Void
}
