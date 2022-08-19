//
//  HomeViewController.swift
//  CryptholicUIKitVersion
//
//  Created by Berkay Disli on 18.08.2022.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController()
    var coins = Coins(coins: [Coin]())
    private var coinsCopy = Coins(coins: [Coin]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        title = "Home"
        navigationItem.largeTitleDisplayMode = .always
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        getData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        
        self.coins = Coins(coins: coinsCopy.coins.filter { $0.name.contains(searchText)})
        
        if searchText.isEmpty {
            coins = coinsCopy
        }
         
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as! HomeCoinTableViewCell
        
        cell.nameLabel.text = coins.coins[indexPath.row].name
        cell.symbolLabel.text = coins.coins[indexPath.row].symbol
        cell.priceLabel.text = Double(round(10000 * coins.coins[indexPath.row].price) / 10000).formatted()
        cell.iconImage.setImage(imageUrl: coins.coins[indexPath.row].icon)
        
        return cell
    }
   
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CoinDetailsViewController") as? CoinDetailsViewController {
            vc.coin = coins.coins[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    
    // MARK: API Call
    func getData() {
            coins = Coins(coins: [Coin]())
            guard let url = URL(string: "https://api.coinstats.app/public/v1/coins") else { return }
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else { return }
                do {
                    let result = try JSONDecoder().decode(Coins.self, from: data)
                    DispatchQueue.main.async {
                        self.coins = result
                        self.coinsCopy = result
                        self.tableView.reloadData()
                    }
                } catch let err {
                    print(err.localizedDescription)
                }
            }
            
            task.resume()
        }

}
