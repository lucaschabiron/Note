//
//  Artist.swift
//  Note
//
//  Created by Lucas Chabiron on 01/01/2024.
//

import Foundation

class Artist {
    var imageURL: String
    var name: String
    var id: String
    
    init(imageURL: String, name: String, id: String) {
        self.imageURL = imageURL
        self.name = name
        self.id = id
    }
}
