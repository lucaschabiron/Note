//
//  Extensions.swift
//  Note
//
//  Created by Lucas Chabiron on 13/12/2023.
//

import Foundation
import UIKit

// Global image cache
let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func load(url: String) {
        let cacheKey = NSString(string: url)
        
        // Check for a cached image
        if let cachedImage = imageCache.object(forKey: cacheKey) {
            self.image = cachedImage
            return
        }
        
        // Guard for a valid URL
        guard let url = URL(string: url) else { return }

        // Perform network request
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }

            // Check for errors, valid data, and make sure response is an image
            if error == nil, let data = data, let image = UIImage(data: data) {
                // Cache the image
                imageCache.setObject(image, forKey: cacheKey)
                
                // Set the image on the main thread
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
