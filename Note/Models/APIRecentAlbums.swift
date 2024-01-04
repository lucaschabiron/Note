//
//  Album.swift
//  Note
//
//  Created by Lucas Chabiron on 30/12/2023.
//

import Foundation

struct AlbumsRes: Codable {
    let data: [Datum]
    let total: Int
    let next: String
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let title: String
    let cover: String
    let coverSmall, coverMedium, coverBig, coverXl: String
    let md5Image, releaseDate: String
    let tracklist: String
    let artist: ArtistRes
    let type: String

    enum CodingKeys: String, CodingKey {
        case id, title, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case releaseDate = "release_date"
        case tracklist, artist, type
    }
}

// MARK: - ArtistRes
struct ArtistRes: Codable {
    let id: Int
    let name: String
    let tracklist: String
    let type: String
}




