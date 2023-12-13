//
//  ViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 12/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    struct Album {
        var imageURL: String
        var name: String
        var artistName: String
    }
    
    @IBOutlet weak var featuredAlbums: UICollectionView!
    
    
    @IBOutlet weak var recentReleases: UICollectionView!
    
    var featured: [Album] = [Album(imageURL: "https://i.scdn.co/image/ab67616d00001e02045fc920ecf4f8094888ec26", name: "Illmatic", artistName: "Nas"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e02045fc920ecf4f8094888ec26", name: "Illmatic", artistName: "Nas"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e02045fc920ecf4f8094888ec26", name: "Illmatic", artistName: "Nas"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e02045fc920ecf4f8094888ec26", name: "Illmatic", artistName: "Nas")]
    
    var recents: [Album] = [Album(imageURL: "https://i.scdn.co/image/ab67616d00001e027db8828819494cf6d0b79fc4", name: "Illmatic", artistName: "Nas"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e027db8828819494cf6d0b79fc4", name: "Illmatic", artistName: "Nas"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e027db8828819494cf6d0b79fc4", name: "Illmatic", artistName: "Nas"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e027db8828819494cf6d0b79fc4", name: "Illmatic", artistName: "Nas")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featuredAlbums {
            return featured.count
        } else {
            return recents.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == featuredAlbums{
            let album = featured[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "featuredAlbum", for: indexPath) as! CollectionViewCell
            cell.image.load(url: album.imageURL)
            cell.layer.cornerRadius = 4
            cell.layer.masksToBounds = true
            return cell}
        if collectionView == recentReleases{
            let album = recents[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentAlbum", for: indexPath) as! CollectionViewCell
            cell.image.load(url: album.imageURL)
            cell.layer.cornerRadius = 4
            cell.layer.masksToBounds = true
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

