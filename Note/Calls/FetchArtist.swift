//
//  FetchArtist.swift
//  Note
//
//  Created by Lucas Chabiron on 04/01/2024.
//

import Foundation

func fetchArtist(id: Int, completion: @escaping (Artist?, Error?) -> Void) {
    let url = URL(string: "https://api.deezer.com/artist/\(id)")!
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(nil, error)
            return
        }
        
        guard let data = data else {
            completion(nil, NSError(domain: "", code: -1, userInfo: nil))
            return
        }
        
        do {
            
            
            
            let artistResponse = try JSONDecoder().decode(ArtistRes.self, from: data)
            
                                           
            let cleanedData: Artist = Artist(name: artistResponse.name, imageURL: artistResponse.pictureBig, albums: [], id: id)
            completion(cleanedData, nil)
        } catch {
            completion(nil, error)
        }
    }.resume()
}


func fetchArtistAlbums(id: Int, completion: @escaping (SimpleAlbumCollection?) -> Void) {
    guard let url = URL(string: "https://api.deezer.com/artist/\(id)/albums") else {
        completion(nil)
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        let decoder = JSONDecoder()
        
        if let data = data {
            do {
                
                let albumsResponse = try decoder.decode(FeaturedAlbumsRes.self, from: data)
                var cleanedData: SimpleAlbumCollection = []
                for album in albumsResponse.data {
                    if album.recordType == RecordTypeEnum.album || album.recordType == RecordTypeEnum.ep {
                        cleanedData.append(SimpleAlbum(title: album.title, imageURL: album.coverBig, id: album.id))
                    }
                }
                
                completion(cleanedData)
            } catch {
                completion(nil)
            }
        } else if let error = error {
            completion(nil)
        }
    }
    task.resume()
}

    
    
            
