//
//  SearchViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 06/01/2024.
//


import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let resultsTable = UITableView()
    private var results: [Album] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return resultsTable.frame.height/12
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = SearchTableViewCell()
        let album = results[indexPath.row]
        cell.populate(with: album)
        return cell
    }
    
    func update(with results: AlbumCollection){
        self.results = results
        resultsTable.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resultsTable.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resultsTable.delegate = self
        resultsTable.dataSource = self
        view.addSubview(resultsTable)
    }
    
    
    
    
}


class SearchViewController: UIViewController, UISearchResultsUpdating{
    
    let searchController = UISearchController(searchResultsController: ResultsViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self as? UISearchBarDelegate
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search for an Album"
        
    }
    
    var results: [Album] = []
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let resultsController = searchController.searchResultsController as? ResultsViewController,
              let query = searchController.searchBar.text?.replacingOccurrences(of: " ", with: "+"),
              !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
            }
        
        useSearch(query: query) { albums, error in
            if let albums = albums {
                DispatchQueue.main.async {
                    resultsController.update(with: albums)
                }
                
                
            } else{
                print(error!)
            }
        }
        
        
    }
    
}
