//
//  FetchAlbums.swift
//  Note
//
//  Created by Lucas Chabiron on 03/01/2024.
//

import Foundation

func fetchAlbums(endpoint: String, completion: @escaping ([Album]?, Error?) -> Void) {
    let url = URL(string: "https://api.deezer.com\(endpoint)")!
    
    
    
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
            
            let albumsResponse = try JSONDecoder().decode(AlbumsRes.self, from: data)
            let cleanedData: AlbumCollection = albumsResponse.data.map { Datum in
                return Album(title: Datum.title,imageURL: Datum.coverXl, artist: Datum.artist.name)
                
            }
            completion(cleanedData, nil)
        } catch {
            completion(nil, error)
        }
    }.resume()
}
