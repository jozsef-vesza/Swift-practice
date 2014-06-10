//
//  MainViewModel.swift
//  Learning
//
//  Created by Jozsef Vesza on 03/06/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

var notification = "mealsDownloaded"

class MainViewModel: NSObject, NSURLSessionDataDelegate {
    
    var model: Meal[] = []
    weak var viewController: MainTableViewController?
    let mealUrl = "http://verdant-upgrade-554.appspot.com/soservices/mealmanager"
    
    init(viewController:UIViewController) {
        self.viewController = viewController as? MainTableViewController
        super.init()
        self.viewController!.viewModel = self
        self.downloadMeals()
    }
    
    func mealsWithImages () -> Meal[] {
        return self.model.filter({ $0.hasImage })
    }
    
    func downloadMeals() {
        let request = NSURLRequest(URL: NSURL(string: self.mealUrl))
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        let task = session.dataTaskWithRequest(request)
        task.resume()
    }
    
    func URLSession(session: NSURLSession!, dataTask: NSURLSessionDataTask!, didReceiveResponse response: NSURLResponse!, completionHandler: ((NSURLSessionResponseDisposition) -> Void)!) {
        self.model = []
        completionHandler(NSURLSessionResponseDisposition.Allow)
    }
    
    func URLSession(session: NSURLSession!, dataTask: NSURLSessionDataTask!, didReceiveData data: NSData!) {
        if data {
            let result = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary[]
            for dictionary in result {
                var meal = Meal()
                meal.name = dictionary["name"] as String
                meal.identifier = dictionary["identifier"] as NSNumber
                
                if dictionary["image"] {
                    meal.hasImage = true
                }
                
                self.model.append(meal)
            }
        }
    }
    
    func URLSession(session: NSURLSession!, task: NSURLSessionTask!, didCompleteWithError error: NSError!) {
        NSNotificationCenter.defaultCenter().postNotificationName(notification, object: self)
    }
    
}