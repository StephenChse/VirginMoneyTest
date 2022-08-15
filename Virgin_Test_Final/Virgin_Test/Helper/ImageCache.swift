//
//  ImageCache.swift
//  Virgin_Test
//
//  Created by Chase on 15/08/2022.
//

import Foundation
import UIKit
let imageCache = NSCache<AnyObject, AnyObject>()
class ImageLoader: UIImageView {
    var imageURL: URL?
    let activityIndicator = UIActivityIndicatorView()
    
    var isPlaceHolder: Bool {
        return self.image == UIImage(named: "placeHolder")
    }
    
    func loadImageWithUrl(_ url: URL, completionHandler: @escaping (()->())) {
        // setup activityIndicator...
        activityIndicator.color = .darkGray
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageURL = url
        image = nil
        activityIndicator.startAnimating()
        //MARK: Retrieves image if already available in cache
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            debugPrint("Fetching image from cache")
            self.image = imageFromCache
            activityIndicator.stopAnimating()
            completionHandler()
            return
        }
        debugPrint("Fetching image from URL")
        self.image = UIImage(named: "placeHolder")
        
        //MARK: Image does not available in cache.. so retrieving it from url...
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error as Any)
                DispatchQueue.main.async(execute: {
                    self.activityIndicator.stopAnimating()
                })
                return
            }
            DispatchQueue.main.async(execute: {
                if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {
                    if self.imageURL == url {
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
                completionHandler()
                self.activityIndicator.stopAnimating()
            })
        }).resume()
    }
}
