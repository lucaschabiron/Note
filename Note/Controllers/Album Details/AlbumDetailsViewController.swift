//
//  AlbumDetailsViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 30/12/2023.
//

import UIKit

class AlbumDetailsViewController: UIViewController {
    
    @IBOutlet weak var albumName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let album = data {
            albumCover.load(url: album.imageURL)
            albumName.text = album.title
            artistName.setTitle(album.artist, for: .normal)
            
            fetchArtist(id: album.artistId) { artistData,error  in
                if let artist = artistData {
                    self.preparedArtist = Artist(name: artist.name, imageURL: artist.imageURL, albums: [], id: artist.id)
                } else {
                    return
                }
            }
        }
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var artistName: UIButton!
    var data: Album?
    var preparedArtist: Artist?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ArtistViewController{
            vc.data = preparedArtist
        }
    }
}
