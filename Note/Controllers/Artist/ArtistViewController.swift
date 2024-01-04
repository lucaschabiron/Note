//
//  ArtistViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 01/01/2024.
//

import UIKit

class ArtistViewController: UIViewController {

    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var artistIcon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let artist = data {
            artistName.text = artist.name
            artistIcon.load(url: artist.imageURL)
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    var data: Artist?

}
