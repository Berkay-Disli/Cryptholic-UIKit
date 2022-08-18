//
//  CoinDetailsViewController.swift
//  CryptholicUIKitVersion
//
//  Created by Berkay Disli on 18.08.2022.
//

import UIKit
import Charts

class CoinDetailsViewController: UIViewController, ChartViewDelegate {
    
    var lineChart = LineChartView()
    
    var coin = Coin(id: "", icon: "", name: "", symbol: "", rank: 0, price: 0, priceBtc: 0, volume: 0, marketCap: 0, availableSupply: 0, totalSupply: 0, priceChange1h: 0, priceChange1d: 0, priceChange1w: 0, websiteURL: "", twitterURL: "", exp: [""], contractAddress: "", decimals: 0, redditURL: "")
    private var selectedTimeZone: TimezoneRanges = .day
    
    @IBOutlet weak var lineChartViewLabel: UIView!
    @IBOutlet weak var iconImage: UIImageView!
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
        
        lineChart.delegate = self
        iconImage.setImage(imageUrl: coin.icon)
        coinNameLabel.text = coin.name
        coinPriceLabel.text = "\(coin.price.formatted())"
        priceChangeLabel.text = "\(coin.priceChange1d ?? 0)"
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lineChart.frame = lineChartViewLabel.frame
        lineChart.center = lineChartViewLabel.center
        lineChart.drawGridBackgroundEnabled = false
        view.addSubview(lineChart)
        getCoinDetailsData(coin: coin)
        
    }
    
    /*
    func chartSettings() {
        let set = LineChartDataSet(entries: [
            ChartDataEntry(x: Double(0), y: Double(1)),
            ChartDataEntry(x: Double(1), y: Double(4)),
            ChartDataEntry(x: Double(2), y: Double(2)),
            ChartDataEntry(x: Double(3), y: Double(8)),
            ChartDataEntry(x: Double(4), y: Double(5))
        ])
        set.colors = ChartColorTemplates.material()
        let data = LineChartData(dataSet: set)
        
        
        lineChart.data = data
    }
     */
    
    func getCoinDetailsData(coin: Coin) {
            guard let url = URL(string: "https://api.coinstats.app/public/v1/charts?period=24h&coinId=\(coin.id)") else { return }
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else { return }
            
                do {
                    let result = try JSONDecoder().decode(CoinPrices.self, from: data)
                    
                    DispatchQueue.main.async {
                        var entries = [ChartDataEntry]()
                        for group in result.chart {
                            entries.append(ChartDataEntry(x: group[0], y: group[2]))
                        }
                        let set = LineChartDataSet(entries: entries)
                        set.colors = ChartColorTemplates.liberty()
                        let data = LineChartData(dataSet: set)
                        self.lineChart.drawMarkers = false
                        self.lineChart.data = data
                        
                    }
                    
                } catch let err {
                    print(err)
                }
            }
            
            task.resume()
        }
    
    
    
    // MARK: Codes below are NOT working properly...
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
