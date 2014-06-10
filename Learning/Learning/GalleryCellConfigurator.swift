//
//  GalleryCellConfigurator.swift
//  Learning
//
//  Created by Jozsef Vesza on 04/06/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

class GalleryCellConfigurator: NSObject, CellConfiguratorDelegate {
    func fetchReuseIdentifierForCell(object usingObject: AnyObject) -> String {
        return "galleryCell"
    }
    
    func configureCell(cell: AnyObject, usingObject object: AnyObject) -> AnyObject {
        let returnCell = cell as GalleryCell
        let meal = object as Meal
        returnCell.mealImage.image = UIImage(data: meal.imageData)
        
        return returnCell
    }
}
