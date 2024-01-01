//
//  StarReviewView.swift
//  Note
//
//  Created by Lucas Chabiron on 31/12/2023.
//

import UIKit

import UIKit

class StarReviewView: UIView {
    var rating = 0.0 // Rating value
    private var starButtons = [UIButton]()
    private let maxRating = 5

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStars()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStars()
    }

    private func setupStars() {
        for _ in 0..<maxRating {
            let button = UIButton()
            button.setImage(UIImage(named: "star_empty"), for: .normal)
            button.setImage(UIImage(named: "star_filled"), for: .selected)
            button.addTarget(self, action: #selector(starTapped(_:)), for: .touchUpInside)
            starButtons.append(button)
            addSubview(button)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let buttonSize = frame.height
        for (index, button) in starButtons.enumerated() {
            button.frame = CGRect(x: Double(index) * buttonSize, y: 0, width: buttonSize, height: buttonSize)
        }
    }

    @objc func starTapped(_ button: UIButton) {
        guard let index = starButtons.firstIndex(of: button) else { return }

        // Set rating based on the tapped button
        // Add logic here for half-star ratings if needed
        rating = Double(index) + 1

        // Update button states
        for (index, button) in starButtons.enumerated() {
            button.isSelected = index < Int(rating)
        }
    }
}

