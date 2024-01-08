//
//  ProfileMethods.swift
//  Note
//
//  Created by Lucas Chabiron on 06/01/2024.
//

import Foundation
import UIKit
import CoreData

func getUserProfile() -> User? {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let fetchUsers: NSFetchRequest<Users> = Users.fetchRequest()
    
    let results = try? context.fetch(fetchUsers)
    if results!.count == 0 {
        return nil
    }
    else {
        let result = results![0]
        let user = User(id: Int(result.id), userName: result.userName!, profilePictureURL: result.profilePictureURL!)
        return user
    }
}
func addUserProfile(userName: String, profilePictureURL: String) -> Void{
    let id = 0
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
    let fetchUsers: NSFetchRequest<Users> = Users.fetchRequest()
    fetchUsers.predicate = NSPredicate(format: "id == %d", id)
    let results = try? context.fetch(fetchUsers)
    
    if results!.count == 0 {
        let newUser = Users(entity: entity!, insertInto: context)
        newUser.userName = userName
        newUser.profilePictureURL = profilePictureURL
        do {
            try context.save()
            return
        } catch {
            return
        }
    }
    else {
        let result = results![0]
        result.setValue(userName, forKey: "userName")
        result.setValue(profilePictureURL, forKey: "profilePictureURL")
        do{
            try context.save()
            return
        }catch{
            return
        }
    }
}
