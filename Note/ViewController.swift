//
//  ViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 12/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var featuredAlbums: UICollectionView!
    
    
    @IBOutlet weak var recentReleases: UICollectionView!
    
    var featured: [Album] = [Album(imageURL: "https://i.scdn.co/image/ab67616d00001e02045fc920ecf4f8094888ec26", name: "Illmatic", artistName: "Nas", id: "1"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e02045fc920ecf4f8094888ec26", name: "Illmatic", artistName: "Nas", id: "1"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e02045fc920ecf4f8094888ec26", name: "Illmatic", artistName: "Nas", id: "1"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e02045fc920ecf4f8094888ec26", name: "Illmatic", artistName: "Nas", id: "1")]
    
    var recents: [Album] = [Album(imageURL: "https://i.scdn.co/image/ab67616d00001e027db8828819494cf6d0b79fc4", name: "Sincèrement", artistName: "Nas",id: "a"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e027db8828819494cf6d0b79fc4", name: "Sincèrement", artistName: "Nas",id: "a"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e027db8828819494cf6d0b79fc4", name: "Sincèrement", artistName: "Nas",id: "a"),Album(imageURL: "https://i.scdn.co/image/ab67616d00001e027db8828819494cf6d0b79fc4", name: "Sincèrement", artistName: "Nas",id: "a")]
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AlbumDetailsViewController {
            if let cell = sender as? UICollectionViewCell {
                if let indexPath = featuredAlbums.indexPath(for: cell) {
                    vc.data = featured[indexPath.row]
                }
            }
            if let cell = sender as? UICollectionViewCell {
                if let indexPath = recentReleases.indexPath(for: cell) {
                    vc.data = recents[indexPath.row]
                }
            }
        }
    }
}

