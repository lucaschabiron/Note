//
//  ReviewMethods.swift
//  Note
//
//  Created by Lucas Chabiron on 05/01/2024.
//

import Foundation
import CoreData
import UIKit

func addReview(review: Review, completion: @escaping (Bool) -> Void) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let entity = NSEntityDescription.entity(forEntityName: "Reviews", in: context)
    
    let fetchReview: NSFetchRequest<Reviews> = Reviews.fetchRequest()
    fetchReview.predicate = NSPredicate(format: "albumId == %d", review.albumId)
    
    let results = try? context.fetch(fetchReview)
    
    if results!.count == 0 {
        let newReview = NSManagedObject(entity: entity!, insertInto: context)
        newReview.setValue(review.albumId, forKey: "albumId")
        newReview.setValue(review.rating, forKey: "rating")
        newReview.setValue(review.text, forKey: "review")
        newReview.setValue(review.date, forKey: "date")
        
        do {
            try context.save()
            completion(true)
        }
        catch {
            completion(false)
        }
    }
    else {
        let result = results![0]
        result.setValue(review.rating, forKey: "rating")
        result.setValue(review.text, forKey: "review")
        result.setValue(review.date, forKey: "date")
        
        do {
            try context.save()
            completion(true)
        }
        catch {
            completion(false)
        }
    }
    
    
}

func getUserReviews() -> ReviewList? {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    var reviews: ReviewList = []
    
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Reviews")
    
    request.returnsObjectsAsFaults = false
    
    do {
        let results = try context.fetch(request)
        for result in results as! [NSManagedObject] {
            let albumId = result.value(forKey: "albumId") as! Int
            let rating = result.value(forKey: "rating") as! Int
            let review = result.value(forKey: "review") as! String
            let date = result.value(forKey: "date") as! Date
            
            let newReview = Review(albumId: albumId, rating: rating, text: review, date: date)
            reviews.append(newReview)
        }
        return reviews
    }
    catch {
        return nil
    }
}

func getRating(albumId: Int) -> Int? {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let fetchReview: NSFetchRequest<Reviews> = Reviews.fetchRequest()
    fetchReview.predicate = NSPredicate(format: "albumId == %d", albumId)
    
    let results = try? context.fetch(fetchReview)
    
    if results!.count == 0 {
        return nil
    }
    else {
        let result = results![0]
        return Int(result.rating)
    }
}

