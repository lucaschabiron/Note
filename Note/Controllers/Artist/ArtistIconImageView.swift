//
//  ArtistIconImageView.swift
//  Note
//
//  Created by Lucas Chabiron on 01/01/2024.
//

import UIKit

class ArtistIconImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 70
        layer.masksToBounds = true
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
