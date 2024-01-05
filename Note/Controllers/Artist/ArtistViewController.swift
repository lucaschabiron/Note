//
//  ArtistViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 01/01/2024.
//

import UIKit

class ArtistViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == albumsCollection {
            return artistAlbums.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == albumsCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistAlbum", for: indexPath) as! CollectionViewCell
            cell.image.load(url:self.artistAlbums[indexPath.row].imageURL)
            cell.layer.cornerRadius = 4
            cell.layer.masksToBounds = true
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    

    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var artistIcon: UIImageView!
    @IBOutlet weak var albumsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let artist = data {
            artistName.text = artist.name
            artistIcon.load(url: artist.imageURL)
            fetchArtistAlbums(id: artist.id){
                albums in
                DispatchQueue.main.async {
                    if let albums = albums {
                        self.artistAlbums.append(contentsOf: albums)
                    } else {
                        return
                    }
                    self.albumsCollection.reloadData()
                }
            }
        }
        
        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        let indexPath = albumsCollection.indexPath(for: cell)!
        let album = artistAlbums[indexPath.row]
        let vc = segue.destination as! AlbumDetailsViewController
        vc.data = Album(title: album.title, imageURL: album.imageURL, artist: self.data!.name, artistId: self.data!.id, id: album.id)
    }
    var data: Artist?
    var artistAlbums: SimpleAlbumCollection = []

}
