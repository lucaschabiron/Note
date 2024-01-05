//
//  APIFeaturedAlbums.swift
//  Note
//
//  Created by Lucas Chabiron on 04/01/2024.
//

import Foundation

struct FeaturedAlbumsRes: Codable {
    let data: [FeaturedDatum]
    let total: Int
}

// MARK: - Datum
struct FeaturedDatum: Codable {
    let id: Int
    let title: String
    let link, cover: String
    let coverSmall, coverMedium, coverBig, coverXl: String
    let md5Image: String
    let recordType: RecordTypeEnum
    let tracklist: String
    let explicitLyrics: Bool
    let position: Int?
    let artist: FeaturedArtistRes?
    let type: RecordTypeEnum

    enum CodingKeys: String, CodingKey {
        case id, title, link, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case recordType = "record_type"
        case tracklist
        case explicitLyrics = "explicit_lyrics"
        case position, artist, type
    }
}

// MARK: - Artist
struct FeaturedArtistRes: Codable {
    let id: Int
    let name: String
    let link, picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let radio: Bool
    let tracklist: String
    let type: ArtistType

    enum CodingKeys: String, CodingKey {
        case id, name, link, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case radio, tracklist, type
    }
}

enum ArtistType: String, Codable {
    case artist = "artist"
}

enum RecordTypeEnum: String, Codable {
    case album = "album"
    case ep = "ep"
    case single = "single"
}
