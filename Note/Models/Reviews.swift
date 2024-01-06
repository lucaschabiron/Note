//
//  Reviews.swift
//  Note
//
//  Created by Lucas Chabiron on 05/01/2024.
//

import Foundation

typealias ReviewList = [Review]

struct Review: Codable {
    let albumId: Int
    let rating: Int
    let text: String
    let date: Date
}
