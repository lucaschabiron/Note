//
//  SearchViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 06/01/2024.
//


import UIKit

class ResultsViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Results"
    }
}


class SearchViewController: UIViewController, UISearchResultsUpdating{
    
    let searchController = UISearchController(searchResultsController: ResultsViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        print(text)
    }
    
    
}
