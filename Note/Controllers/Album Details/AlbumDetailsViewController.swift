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
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var artistName: UIButton!
    var data: Album?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ArtistViewController{
            vc.data = Artist(imageURL: "", name: "", id: "")
        }
    }
}
