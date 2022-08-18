//
//  HomeViewController.swift
//  CryptholicUIKitVersion
//
//  Created by Berkay Disli on 18.08.2022.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var coins = Coins(coins: [Coin]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        title = "Home"
        navigationItem.largeTitleDisplayMode = .always
        
        getData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as! HomeCoinTableViewCell
        
        cell.nameLabel.text = coins.coins[indexPath.row].name
        cell.symbolLabel.text = coins.coins[indexPath.row].symbol
        cell.priceLabel.text = Double(round(10000 * coins.coins[indexPath.row].price) / 10000).formatted()
        
        
        return cell
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "showCoinDetails"
                let destination = segue.destination as? DetailsViewController,
                let index = tableView.indexPathForSelectedRow?.row
            {
                destination.blogName = swiftBlogs[blogIndex]
            }
    }
    */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCoinDetails", sender: nil)
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
                        self.tableView.reloadData()
                    }
                } catch let err {
                    print(err.localizedDescription)
                }
            }
            
            task.resume()
        }

}
