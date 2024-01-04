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
    
    var featured: AlbumCollection = []
    var recents: AlbumCollection = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchRecentAlbums(number: 6) { albums, error in
            DispatchQueue.main.async {
                if let albums = albums {
                    self.recents.append(contentsOf: albums)
                   
                    self.recentReleases.reloadData()

                } else if error != nil {
                    return
                }
            }
        }
        fetchFeaturedAlbums(number: 6) { albums, error in
            DispatchQueue.main.async {
                if let albums = albums {
                    self.featured.append(contentsOf: albums)
                    self.featuredAlbums.reloadData()
                    
                } else if error != nil {
                    return
                }
            }
        }

    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featuredAlbums {
            return featured.count
        } else {
            return recents.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        if collectionView == featuredAlbums {
            for indexPath in indexPaths {
                let album = featured[indexPath.row]
                let _ = album.imageURL
            }
        } else {
            for indexPath in indexPaths {
                let album = recents[indexPath.row]
                let _ = album.imageURL
            }
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

