//
//  ScreenCategories.swift
//  BlackStarProject
//
//  Created by Роман Зобнин on 02.12.2021.
//

import UIKit

class ScreenCategories: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var CategoriesTable: UITableView!
    var url = "https://blackstarshop.ru/index.php?route=api/v1/categories"
    var loadCategories = [Category]()
    var loadData = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoriesTable.delegate = self
        CategoriesTable.dataSource = self
        loadData.fetchDataCategory(urlString: url) { (data: [Category]) in
            DispatchQueue.main.async {
                self.loadCategories = data
                self.CategoriesTable.reloadData()
            }
        }
    }
}

extension ScreenCategories: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CategoriesCell = self.CategoriesTable.dequeueReusableCell(withIdentifier: "Cell") as! CategoriesCell
        cell.CategoriesName.text = loadCategories[indexPath.row].name
        
        return cell
    }
}

extension ScreenCategories: ReloadCellDelegate {
    func reloadCell(at index: IndexPath?) {
        if let index = index{
            
            CategoriesTable.reloadRows(at: [index], with: .automatic)
        }
    }
}
