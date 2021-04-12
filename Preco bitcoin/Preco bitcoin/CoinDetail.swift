//
//  CoinDetail.swift
//  Preco bitcoin
//
//  Created by Gilberto Silva on 11/04/21.
//

import Foundation

private extension String {
    static let latePrice = "15m"
    static let recentPrice = "last"
    static let buy = "buy"
    static let sell = "sell"
    static let symbol = "symbol"
}

public class CoinDetail: Codable  {
    let code: String
    let latePrice: Double
    let recentPrice: Double
    let buy: Double
    let sell: Double
    let symbol: String
    
    public init(code: String, dictionary: [String: Any]) {
        self.code = code
        guard
            let latePriceReceived = dictionary[.latePrice] as? Double,
            let recentPriceReceived = dictionary[.recentPrice] as? Double,
            let buyReceived = dictionary[.buy] as? Double,
            let sellReceived = dictionary[.sell] as? Double,
            let symbolReceived = dictionary[.symbol] as? String
        else {
            self.latePrice = 0.0
            self.recentPrice = 0.0
            self.buy = 0.0
            self.sell = 0.0
            self.symbol = ""
            return
        }
        self.latePrice = latePriceReceived
        self.recentPrice = recentPriceReceived
        self.buy = buyReceived
        self.sell = sellReceived
        self.symbol = symbolReceived
    }
}
