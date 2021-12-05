//
//  ModelCategories.swift
//  BlackStarProject
//
//  Created by Роман Зобнин on 05.12.2021.
//

import Foundation

struct Category {
    let name: String
    let image: String
    let subcategories: [Subcategory]
}

struct Subcategory {
    var id: String
    let name: String
}
