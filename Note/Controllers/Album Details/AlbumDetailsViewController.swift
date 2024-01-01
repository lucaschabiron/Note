//
//  AlbumDetailsViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 30/12/2023.
//

import UIKit

class AlbumDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let album = data {
            albumCover.load(url: album.imageURL)
            albumName.text = album.name
            artistName.setTitle(album.artistName, for: .normal)
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    
    @IBOutlet weak var artistName: UIButton!
    var data: Album?
}
