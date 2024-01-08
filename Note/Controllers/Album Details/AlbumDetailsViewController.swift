//
//  AlbumDetailsViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 30/12/2023.
//

import UIKit

class AlbumDetailsViewController: UIViewController {
    
    @IBAction func unwindFromReview(unwindSegue: UIStoryboardSegue){
        if let _ = unwindSegue.source as? RateAlbumViewController{
            if let rating = self.rating{
                Rating.text = rating
            }
        }
    }
    
    
    @IBOutlet weak var albumName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let album = data {
            let getRating = getRating(albumId: album.id)
            if getRating != nil{
                self.rating = "\(getRating!)"
            }
            albumCover.load(url: album.imageURL)
            albumName.text = album.title
            artistName.setTitle(album.artist, for: .normal)
            if let _ = self.rating{
                Rating.text = rating
            }
            else{
                Rating.text = "Not rated yet"
            }
            
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
    
    
    @IBOutlet weak var Rating: UILabel!
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var artistName: UIButton!
    var data: Album?
    var preparedArtist: Artist?
    var rating: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ArtistViewController{
            vc.data = preparedArtist
        }
        if let vc = segue.destination as? RateAlbumViewController{
            vc.data = data
            if let rating = self.rating{
                vc.previousRating = Int(rating)
            }
        }
        if let vc = segue.destination as? ProfileViewController{
            vc.newRating = data
        }
    }
}
