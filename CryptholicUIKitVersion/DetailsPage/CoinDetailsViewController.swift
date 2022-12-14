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
    
    
    @IBOutlet weak var lineChartViewLabel: LineChartView!
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
        navigationItem.largeTitleDisplayMode = .never
        
        getCoinDetailsData(coin: coin)

        lineChart.delegate = self
        
        lineChart.frame = lineChartViewLabel.frame
        lineChart.center = lineChartViewLabel.center
        lineChart.frame = lineChart.frame.offsetBy(dx: CGFloat(0), dy: CGFloat(-120))
        
        lineChartViewLabel.addSubview(lineChart)
        
        
        iconImage.setImage(imageUrl: coin.icon)
        coinNameLabel.text = coin.name
        coinPriceLabel.text = "\(coin.price.formatted())"
        priceChangeLabel.text = "\(coin.priceChange1d ?? 0)"
        
        
    }
    
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
                        set.drawCirclesEnabled = false
                        set.lineWidth = 1.7
                        set.colors = [.red]
                        let data = LineChartData(dataSet: set)
                        self.lineChart.drawGridBackgroundEnabled = true
                        self.lineChart.gridBackgroundColor = .white
                        self.lineChart.xAxis.enabled = false
                        self.lineChart.leftAxis.enabled = false
                        self.lineChart.rightAxis.enabled = false
                        self.lineChart.chartDescription.enabled = false
                        self.lineChart.legend.enabled = false
                        self.lineChart.data = data
                        
                    }
                    
                } catch let err {
                    print(err)
                }
            }
            
            task.resume()
        }
    
    
    
    // MARK: Codes below are garbage
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
