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

struct SingleAlbumRes: Codable {
    let id: Int
    let title: String
    let upc: String
    let link, share, cover: String
    let coverSmall, coverMedium, coverBig, coverXl: String
    let md5Image: String
    let genreID: Int
    let genres: Genres
    let label: String
    let nbTracks, duration, fans: Int
    let releaseDate: String
    let recordType: RecordTypeEnum
    let available: Bool
    let tracklist: String
    let explicitLyrics: Bool
    let explicitContentLyrics, explicitContentCover: Int
    let contributors: [Contributor]
    let artist: SingleAlbumArtist
    let type: RecordTypeEnum
    let tracks: Tracks

    enum CodingKeys: String, CodingKey {
        case id, title, upc, link, share, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case genreID = "genre_id"
        case genres, label
        case nbTracks = "nb_tracks"
        case duration, fans
        case releaseDate = "release_date"
        case recordType = "record_type"
        case available, tracklist
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case contributors, artist, type, tracks
    }
}

// MARK: - Artist
struct SingleAlbumArtist: Codable {
    let id: Int
    let name: String
    let picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let tracklist: String
    let type: ArtistType

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case tracklist, type
    }
}


enum ArtistType: String, Codable {
    case artist = "artist"
    case genre = "genre"
}

// MARK: - Contributor
struct Contributor: Codable {
    let id: Int
    let name: String
    let link, share, picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let radio: Bool
    let tracklist: String
    let type: ArtistType
    let role: String

    enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case radio, tracklist, type, role
    }
}

// MARK: - Genres
struct Genres: Codable {
    let data: [ArtistElement]
}

// MARK: - ArtistElement
struct ArtistElement: Codable {
    let id: Int
    let name: String
    let picture: String?
    let type: ArtistType
    let tracklist: String?
}


// MARK: - Tracks
struct Tracks: Codable {
    let data: [TracksDatum]
}

// MARK: - TracksDatum
struct TracksDatum: Codable {
    let id: Int
    let readable: Bool
    let title, titleShort, titleVersion: String
    let link: String
    let duration, rank: Int
    let explicitLyrics: Bool
    let explicitContentLyrics, explicitContentCover: Int
    let preview: String
    let md5Image: String
    let artist: ArtistElement
    let album: moreAlbum
    let type: PurpleType

    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case link, duration, rank
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview
        case md5Image = "md5_image"
        case artist, album, type
    }
}

// MARK: - Album
struct moreAlbum: Codable {
    let id: Int
    let title: String
    let cover: String
    let coverSmall, coverMedium, coverBig, coverXl: String
    let md5Image: String
    let tracklist: String
    let type: RecordTypeEnum

    enum CodingKeys: String, CodingKey {
        case id, title, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case tracklist, type
    }
}

enum PurpleType: String, Codable {
    case track = "track"
}
