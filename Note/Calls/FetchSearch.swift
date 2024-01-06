//
//  FetchSearch.swift
//  Note
//
//  Created by Lucas Chabiron on 06/01/2024.
//

import Foundation

func useSearch(query: String, completion: @escaping ([Album]?, Error?) -> Void) {
    
    let url = URL(string: "https://api.deezer.com/search/album?q=\(query)&limit=10")!
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        let decoder = JSONDecoder()
        if let error = error {
            completion(nil, error)
            return
        }
        guard let data = data else {
            completion(nil, NSError(domain: "", code: -1, userInfo: nil))
            return
        }
        do {
            let searchRes = try decoder.decode(SearchAlbums.self, from: data)
            let albums: AlbumCollection = searchRes.data.map{ album in
                let newAlbum = Album(title: album.title, imageURL: album.coverBig, artist: album.artist.name, artistId: album.artist.id, id: album.id)
                return newAlbum
                
            }
            completion(albums, nil)
        } catch let error {
            completion(nil, error)
        
        }
    }
    task.resume()
}
