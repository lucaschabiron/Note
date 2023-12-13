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
    
    
        var albums: [Album] = [Album(imageURL: "https://i.scdn.co/image/ab67616d00001e02045fc920ecf4f8094888ec26", name: "Illmatic", artistName: "Nas"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e02045fc920ecf4f8094888ec26", name: "Illmatic", artistName: "Nas"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e02045fc920ecf4f8094888ec26", name: "Illmatic", artistName: "Nas"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e02045fc920ecf4f8094888ec26", name: "Illmatic", artistName: "Nas")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let album = albums[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "featuredAlbum", for: indexPath) as! CollectionViewCell
        cell.image.load(url: album.imageURL)
        cell.layer.cornerRadius = 2
        cell.layer.masksToBounds = true
        return cell
    }
    
    
}

