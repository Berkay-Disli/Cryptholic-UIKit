//
//  CoinDetailsViewController.swift
//  CryptholicUIKitVersion
//
//  Created by Berkay Disli on 18.08.2022.
//

import UIKit

class CoinDetailsViewController: UIViewController {
    
    var coin = Coin(id: "", icon: "", name: "", symbol: "", rank: 0, price: 0, priceBtc: 0, volume: 0, marketCap: 0, availableSupply: 0, totalSupply: 0, priceChange1h: 0, priceChange1d: 0, priceChange1w: 0, websiteURL: "", twitterURL: "", exp: [""], contractAddress: "", decimals: 0, redditURL: "")
     
    
    @IBOutlet weak var coinNameLabel: UILabel!
    
    @IBOutlet weak var coinPriceLabel: UILabel!
    
    @IBOutlet weak var priceChangeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coinNameLabel.text = coin.name
        coinPriceLabel.text = "\(coin.price.formatted())"
        priceChangeLabel.text = "\(coin.priceChange1d ?? 0)"
    }
    
    @IBAction func dayButtonTapped(_ sender: Any) {
    }
    
    @IBAction func weekButtonTapped(_ sender: Any) {
    }
    
    @IBAction func monthButtonTapped(_ sender: Any) {
    }
    
    @IBAction func threeMonthsButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func sixMonthsButtonTapped(_ sender: Any) {
    }
    
    @IBAction func yearButtonTapped(_ sender: Any) {
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
    }
    
    
}
