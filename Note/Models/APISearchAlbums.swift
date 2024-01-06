import Foundation

// MARK: - SearchAlbum
struct SearchAlbums: Codable {
    let data: [SearchDatum]
    let total: Int
    let next: String?
}

// MARK: - Datum
struct SearchDatum: Codable {
    let id: Int
    let title: String
    let link, cover: String
    let coverSmall, coverMedium, coverBig, coverXl: String
    let md5Image: String
    let genreID, nbTracks: Int
    let recordType: String
    let tracklist: String
    let explicitLyrics: Bool
    let artist: SearchArtist

    enum CodingKeys: String, CodingKey {
        case id, title, link, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case genreID = "genre_id"
        case nbTracks = "nb_tracks"
        case recordType = "record_type"
        case tracklist
        case explicitLyrics = "explicit_lyrics"
        case artist
    }
}

// MARK: - Artist
struct SearchArtist: Codable {
    let id: Int
    let name: String
    let link, picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let tracklist: String
    let type: SearchArtistType

    enum CodingKeys: String, CodingKey {
        case id, name, link, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case tracklist, type
    }
}

enum SearchArtistType: String, Codable {
    case artist = "artist"
}

enum SearchRecordTypeEnum: String, Codable {
    case album = "album"
    case ep = "ep"
    case single = "single"
    case track = "track"
    case compile = "compile"
}
