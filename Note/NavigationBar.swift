//
//  NavigationBar.swift
//  Note
//
//  Created by Lucas Chabiron on 30/12/2023.
//

import Foundation
import UIKit

class NavigationBar: UINavigationBar {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        self.tintColor = .label
        self.standardAppearance = appearance
        self.scrollEdgeAppearance = appearance
    }
    
}
