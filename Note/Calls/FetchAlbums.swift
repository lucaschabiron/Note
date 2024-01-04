//
//  FetchAlbums.swift
//  Note
//
//  Created by Lucas Chabiron on 03/01/2024.
//

import Foundation

func fetchRecentAlbums(number: Int, completion: @escaping ([Album]?, Error?) -> Void) {
    let url = URL(string: "https://api.deezer.com/editorial/0/releases?limit=\(number)")!
    
    
    
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
            
            let albumsResponse = try JSONDecoder().decode(RecentAlbumsRes.self, from: data)
            let cleanedData: AlbumCollection = albumsResponse.data.map { Datum in
                return Album(title: Datum.title,imageURL: Datum.coverXl, artist: Datum.artist.name)
                
            }
            completion(cleanedData, nil)
        } catch {
            completion(nil, error)
        }
    }.resume()
}

func fetchFeaturedAlbums(number: Int, completion: @escaping ([Album]?, Error?) -> Void) {
    let url = URL(string: "https://api.deezer.com/chart/0/albums?limit=\(number)")!
    
    
    
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
            
            let albumsResponse = try JSONDecoder().decode(FeaturedAlbumsRes.self, from: data)
            let cleanedData: AlbumCollection = albumsResponse.data.map { Datum in
                return Album(title: Datum.title, imageURL: Datum.coverXl, artist: Datum.artist.name)
                
            }
            completion(cleanedData, nil)
        } catch {
            completion(nil, error)
        }
    }.resume()
}
