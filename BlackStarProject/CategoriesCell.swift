//
//  CategoriesCell.swift
//  BlackStarProject
//
//  Created by Роман Зобнин on 05.12.2021.
//

import Foundation
import UIKit

protocol ReloadCellDelegate {
    func reloadCell(at index: IndexPath?)
}

class CategoriesCell: UITableViewCell{
    
    @IBOutlet weak var CategoriesName: UILabel!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    @IBOutlet weak var CategoriesImage: UIImageView!
    
    var index: IndexPath?
    var delegate : ReloadCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        activitiIndicator.startAnimating()
        activitiIndicator.hidesWhenStopped = true
    }
    
    func configureCell(with object: Category) {
        activitiIndicator.startAnimating()
        CategoriesImage.layer.cornerRadius = CategoriesImage.frame.height / 2
        CategoriesName.text = object.name
        CategoriesImage.isHidden = false
        activitiIndicator.stopAnimating()
    }
}
