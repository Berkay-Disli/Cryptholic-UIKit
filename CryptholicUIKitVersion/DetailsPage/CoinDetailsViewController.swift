//
//  CoinDetailsViewController.swift
//  CryptholicUIKitVersion
//
//  Created by Berkay Disli on 18.08.2022.
//

import UIKit

class CoinDetailsViewController: UIViewController {
    
    var coin = Coin(id: "", icon: "", name: "", symbol: "", rank: 0, price: 0, priceBtc: 0, volume: 0, marketCap: 0, availableSupply: 0, totalSupply: 0, priceChange1h: 0, priceChange1d: 0, priceChange1w: 0, websiteURL: "", twitterURL: "", exp: [""], contractAddress: "", decimals: 0, redditURL: "")
    private var selectedTimeZone: TimezoneRanges = .day
    
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var coinPriceLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    
    @IBOutlet weak var dayButton: UIButton!
    
    @IBOutlet weak var weekButton: UIButton!
    @IBOutlet weak var monthButton: UIButton!
    @IBOutlet weak var threeMonthsButton: UIButton!
    @IBOutlet weak var sixMonthsButton: UIButton!
    @IBOutlet weak var yearButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinNameLabel.text = coin.name
        coinPriceLabel.text = "\(coin.price.formatted())"
        priceChangeLabel.text = "\(coin.priceChange1d ?? 0)"
    }
    
    @IBAction func dayButtonTapped(_ sender: Any) {
        dayButton.titleLabel?.textColor = .red
        weekButton.titleLabel?.textColor = .systemGray
        monthButton.titleLabel?.textColor = .systemGray
        threeMonthsButton.titleLabel?.textColor = .systemGray
        sixMonthsButton.titleLabel?.textColor = .systemGray
        yearButton.titleLabel?.textColor = .systemGray
    }
    
    @IBAction func weekButtonTapped(_ sender: Any) {
        dayButton.titleLabel?.textColor = .systemGray
        weekButton.titleLabel?.textColor = .red
        monthButton.titleLabel?.textColor = .systemGray
        threeMonthsButton.titleLabel?.textColor = .systemGray
        sixMonthsButton.titleLabel?.textColor = .systemGray
        yearButton.titleLabel?.textColor = .systemGray
    }
    
    @IBAction func monthButtonTapped(_ sender: Any) {
        dayButton.titleLabel?.textColor = .systemGray
        weekButton.titleLabel?.textColor = .systemGray
        monthButton.titleLabel?.textColor = .red
        threeMonthsButton.titleLabel?.textColor = .systemGray
        sixMonthsButton.titleLabel?.textColor = .systemGray
        yearButton.titleLabel?.textColor = .systemGray
    }
    
    @IBAction func threeMonthsButtonTapped(_ sender: Any) {
        dayButton.titleLabel?.textColor = .systemGray
        weekButton.titleLabel?.textColor = .systemGray
        monthButton.titleLabel?.textColor = .systemGray
        threeMonthsButton.titleLabel?.textColor = .red
        sixMonthsButton.titleLabel?.textColor = .systemGray
        yearButton.titleLabel?.textColor = .systemGray
    }
    
    @IBAction func sixMonthsButtonTapped(_ sender: Any) {
        dayButton.titleLabel?.textColor = .systemGray
        weekButton.titleLabel?.textColor = .systemGray
        monthButton.titleLabel?.textColor = .systemGray
        threeMonthsButton.titleLabel?.textColor = .systemGray
        sixMonthsButton.titleLabel?.textColor = .red
        yearButton.titleLabel?.textColor = .systemGray
    }
    
    @IBAction func yearButtonTapped(_ sender: Any) {
        dayButton.titleLabel?.textColor = .systemGray
        weekButton.titleLabel?.textColor = .systemGray
        monthButton.titleLabel?.textColor = .systemGray
        threeMonthsButton.titleLabel?.textColor = .systemGray
        sixMonthsButton.titleLabel?.textColor = .systemGray
        yearButton.titleLabel?.textColor = .red
    }
    
    
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
    }
    
    
}
