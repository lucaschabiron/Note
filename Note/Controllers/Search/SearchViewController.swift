//
//  SearchViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 06/01/2024.
//


import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let resultsTable = UITableView()
    private var results: [Album] = []
    var navController: UINavigationController?
    
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
        resultsTable.delegate = self
        resultsTable.dataSource = self
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = results[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "AlbumDetailsViewController") as? AlbumDetailsViewController {
            vc.data = album

            if let searchNavController = self.navController {
                tableView.deselectRow(at: indexPath, animated: true)
                searchNavController.pushViewController(vc, animated: true)
            } else {
                print("Error")
            }
        }
    }
    
    
    
    
}


class SearchViewController: UIViewController, UISearchResultsUpdating{
    
    let searchController = UISearchController(searchResultsController: ResultsViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self as? UISearchBarDelegate
        searchController.searchBar.placeholder = "Search for an Album"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        let nav = navigationController
        let resultsController = searchController.searchResultsController as! ResultsViewController
        resultsController.navController = nav
        
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
