//
//  ProfileViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 06/01/2024.
//

import UIKit


class ProfileViewController: UIViewController {

    var user: User?
    var newRating: Album?
    var latestReviews: [Album] = []
    var favouriteAlbums: [Album] = []
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBAction func unwindFromReview(unwindSegue: UIStoryboardSegue){
        if let _ = unwindSegue.source as? EditProfileViewController{
            profilePicture.load(url: user!.profilePictureURL)
            userNameLabel.text = user!.userName
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let latestId = getLatestReviewed() ?? []
        for id in latestId {
            self.latestReviews = []
            getAlbum(id: id) { album, error in
                DispatchQueue.main.async {
                    if let album = album {
                        self.latestReviews.append(album)
                        self.latestReviewsCollection.reloadData()
                    } else if error != nil {
                        return
                    }
                }
            }
        }
        let favouriteId = getFavouriteAlbums() ?? []
        for id in favouriteId {
            self.favouriteAlbums = []
            getAlbum(id: id) { album, error in
                DispatchQueue.main.async {
                    if let album = album {
                        self.favouriteAlbums.append(album)
                        self.favouriteAlbumsCollection.reloadData()
                    } else if error != nil {
                        return
                    }
                }
            }
        }
        favouriteAlbumsCollection.reloadData()
        latestReviewsCollection.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        latestReviewsCollection.dataSource = self
        latestReviewsCollection.delegate = self
        favouriteAlbumsCollection.dataSource = self
        favouriteAlbumsCollection.delegate = self
        if let profile = getUserProfile() {
            user = User(id: profile.id, userName: profile.userName, profilePictureURL: profile.profilePictureURL)
        }
        if let profilePictureURL = user?.profilePictureURL{
            profilePicture.load(url: profilePictureURL)
        }
        profilePicture.layer.cornerRadius = profilePicture.frame.size.width / 2
        if let username = user?.userName {
            userNameLabel.text = username
        }
    }
    
    @IBOutlet weak var latestReviewsCollection: UICollectionView!
    @IBOutlet weak var favouriteAlbumsCollection: UICollectionView!
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditProfileViewController{
            vc.prevData = self.user
            
        }
        if let vc = segue.destination as? AlbumDetailsViewController {
            if let cell = sender as? UICollectionViewCell {
                if let indexPath = latestReviewsCollection.indexPath(for: cell) {
                    vc.data = latestReviews[indexPath.row]
                }
                if let indexPath = favouriteAlbumsCollection.indexPath(for: cell) {
                    vc.data = favouriteAlbums[indexPath.row]
                }
            }
            if let cell = sender as? UICollectionViewCell {
                if let indexPath = favouriteAlbumsCollection.indexPath(for: cell) {
                    vc.data = favouriteAlbums[indexPath.row]
                }
            }
        }
    }
    

}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == latestReviewsCollection{
            return latestReviews.count
        } else {
            return favouriteAlbums.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == latestReviewsCollection{
            let album = latestReviews[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestReview", for: indexPath) as! RatedCollectionViewCell
            cell.image.load(url: album.imageURL)
            cell.layer.cornerRadius = 4
            cell.layer.masksToBounds = true
            cell.rating.text = String(getRating(albumId: album.id) ?? 0)
            return cell
        }
        if collectionView == favouriteAlbumsCollection{
            let album = favouriteAlbums[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favouriteAlbum", for: indexPath) as! RatedCollectionViewCell
            cell.image.load(url: album.imageURL)
            cell.layer.cornerRadius = 4
            cell.layer.masksToBounds = true
            cell.rating.text = String(getRating(albumId: album.id) ?? 0)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
