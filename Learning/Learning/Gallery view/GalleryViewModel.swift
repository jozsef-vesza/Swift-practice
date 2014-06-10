//
//  GalleryViewModel.swift
//  Learning
//
//  Created by Jozsef Vesza on 04/06/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

let imageNotification = "imagesDownloaded"

class GalleryViewModel: NSObject, NSURLSessionDataDelegate {
    
    let mealImageUrl = "http://verdant-upgrade-554.appspot.com/soservices/mealimageservice"
    weak var viewController: GalleryViewController?
    var model: Meal[]
    
    init(viewController: UIViewController, model:Meal[]) {
        self.viewController = viewController as? GalleryViewController
        self.model = model
        super.init()
        self.viewController!.viewModel = self
        self.downloadImages()
    }
    
    func downloadImages() {
        for (index, meal) in enumerate(self.model) {
            let actualImageUrlString = mealImageUrl + "?identifier=\(meal.identifier)"
            let request = NSURLRequest(URL: NSURL(string: actualImageUrlString))
            let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
            let session = NSURLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
            let task = session.dataTaskWithRequest(request)
            NSNotificationCenter.defaultCenter().postNotificationName(startAnimNotification, object: nil, userInfo: ["meal" : meal.name])
            task.resume()
        }
    }
    
    func URLSession(session: NSURLSession!, dataTask: NSURLSessionDataTask!, didReceiveResponse response: NSURLResponse!, completionHandler: ((NSURLSessionResponseDisposition) -> Void)!) {
        completionHandler(NSURLSessionResponseDisposition.Allow)
    }
    
    func URLSession(session: NSURLSession!, dataTask: NSURLSessionDataTask!, didReceiveData data: NSData!) {
        let correctMeal = self.loadMealByIdentifier("\(dataTask.originalRequest)");
        if correctMeal.meal {
            var imageData = correctMeal.meal!.imageData.mutableCopy() as NSMutableData
            imageData.appendData(data)
            correctMeal.meal!.imageData = imageData as NSData
        }
    }
    
    func URLSession(session: NSURLSession!, task: NSURLSessionTask!, didCompleteWithError error: NSError!) {
        let correctMeal = self.loadMealByIdentifier("\(task.originalRequest)")
        if correctMeal.index {
            NSNotificationCenter.defaultCenter().postNotificationName(imageNotification, object: self, userInfo: ["index" : correctMeal.index!])
            NSNotificationCenter.defaultCenter().postNotificationName(stopAnimNotification, object: nil, userInfo: ["meal" : correctMeal.meal!.name])
        }
    }
    
    func loadMealByIdentifier(identifier: String) -> (meal: Meal?, index: Int?) {
        for (index, meal) in enumerate(self.model) {
            if identifier.bridgeToObjectiveC().containsString("\(meal.identifier)") {
                return (meal, index)
            }
        }
        
        return (nil, nil)
    }
    
}
