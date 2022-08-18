//
//  Coins.swift
//  CryptholicUIKitVersion
//
//  Created by Berkay Disli on 18.08.2022.
//

import Foundation
import UIKit

struct Coins: Codable, Hashable{
    let coins: [Coin]
}

// MARK: - Coin
struct Coin: Codable, Hashable {
    let id: String
    let icon: String
    let name, symbol: String
    let rank: Int
    let price, priceBtc: Double
    let volume: Double?
    let marketCap, availableSupply, totalSupply, priceChange1h: Double?
    let priceChange1d, priceChange1w: Double?
    let websiteURL: String?
    let twitterURL: String?
    let exp: [String]
    let contractAddress: String?
    let decimals: Int?
    let redditURL: String?
}

struct CoinPrices: Codable {
    let chart: [[Double]]
}

enum TimezoneRanges: String, CaseIterable {
    case day, week, month, threeMonts, sixMonths, year
    
    var urlValue: String {
        switch self {
            // 24h | 1w | 1m | 3m | 6m | 1y |all
        case .day:
            return "24h"
        case .week:
            return "1w"
        case .month:
            return "1m"
        case .threeMonts:
            return "3m"
        case .sixMonths:
            return "6m"
        case .year:
            return "1y"
        }
    }
}
