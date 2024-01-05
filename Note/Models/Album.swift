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
    let artistId: Int
    let id: Int
}

typealias AlbumCollection = [Album]

struct SimpleAlbum: Codable {
    let title: String
    let imageURL: String
    let id: Int
}

typealias SimpleAlbumCollection = [SimpleAlbum]
