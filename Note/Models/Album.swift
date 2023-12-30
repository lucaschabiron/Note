//
//  Album.swift
//  Note
//
//  Created by Lucas Chabiron on 30/12/2023.
//

import Foundation

class Album {
    var imageURL: String
    var name: String
    var artistName: String
    var id: String
    
    init(imageURL: String, name: String, artistName: String, id: String) {
        self.imageURL = imageURL
        self.name = name
        self.artistName = artistName
        self.id = id
    }
}
