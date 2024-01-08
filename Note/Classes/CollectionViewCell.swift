//
//  CollectionViewCell.swift
//  Note
//
//  Created by Lucas Chabiron on 12/12/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var image: UIImageView!
    
}

class RatedCollectionViewCell: CollectionViewCell{
    
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var Circle: UIImageView!
    
}
