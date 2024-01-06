//
//  RateAlbumViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 31/12/2023.
//

import UIKit

class RateAlbumViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var ratingPicker: UIPickerView!
    
    var previousRating: Int?
    var data: Album?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

            let label = UILabel()
            label.text = "\(row+1)"
            label.textAlignment = .center
            label.font = UIFont(name: "Hiragino Mincho ProN W3", size: 18)
            return label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingPicker.delegate = self
        ratingPicker.dataSource = self
        if let prev = previousRating{
            ratingPicker.selectRow(prev-1, inComponent: 0, animated: true)
        }
        if let album = data{
            albumName.text = album.title
            albumCover.load(url: album.imageURL)
            albumCover.layer.cornerRadius = 3
            albumCover.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as? UIBarButtonItem != saveButton {return
        }
        if let vc = segue.destination as? AlbumDetailsViewController{
            if let album = data {
                let review = Review(albumId: album.id, rating: ratingPicker.selectedRow(inComponent: 0)+1, text:"", date: Date())
                addReview(review: review){_ in
                    vc.data = album
                    vc.rating = "\(review.rating)"
                }
            }
        }
        
        
        }

}
