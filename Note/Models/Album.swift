//
//  Album.swift
//  Note
//
//  Created by Lucas Chabiron on 04/01/2024.
//

import Foundation

struct Album: Codable {
    let title: String
    let imageURL: String
    let artist: String
    // Add other album properties as needed
}

typealias AlbumCollection = [Album]
