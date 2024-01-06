//
//  SearchTableViewCell.swift
//  Note
//
//  Created by Lucas Chabiron on 06/01/2024.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    static let identifier = "SearchTableViewCell"
    
    private let trackName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont(name: "Hiragino Mincho ProN W3", size: 18)
        return label
    }()
    
    private let artistName: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont(name: "Hiragino Mincho ProN W3", size: 14)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(trackName)
        contentView.addSubview(artistName)
        contentView.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.frame = CGRect(x: 10, y: 4, width: contentView.frame.height-8, height: contentView.frame.height-8)
        iconImageView.layer.cornerRadius = 2
        iconImageView.layer.masksToBounds = true
        trackName.frame = CGRect(x: iconImageView.frame.maxX + 10, y: 0, width: contentView.frame.width - iconImageView.frame.maxX - 15, height: contentView.frame.height/2)
        artistName.frame = CGRect(x: iconImageView.frame.maxX + 10, y: contentView.frame.height/2, width: contentView.frame.width - iconImageView.frame.maxX - 15, height: contentView.frame.height/2)
    }
       
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        trackName.text = nil
        artistName.text = nil
        
    }
    
    func populate(with album: Album){
        trackName.text = album.title
        artistName.text = album.artist
        iconImageView.load(url: album.imageURL)
    }

}
