//
//  DataResponse.swift
//  Preco bitcoin
//
//  Created by Gilberto Silva on 11/04/21.
//

import Foundation

public class DataResponse {
    let coins: [CoinDetail?]
    
    public init?(data: Data){
        do {
            guard
                let objectJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            else { return nil}
            
            self.coins = objectJson.map { (item) -> CoinDetail? in
                let (key, value) = item
                guard
                    let coinDictionary = value as? [String: Any]
                else { return nil}
                return CoinDetail(code: key, dictionary: coinDictionary)
            }
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

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
    
    public init?(code: String, dictionary: [String: Any]) {
        
        guard
            let latePriceReceived = dictionary[.latePrice] as? Double,
            let recentPriceReceived = dictionary[.recentPrice] as? Double,
            let buyReceived = dictionary[.buy] as? Double,
            let sellReceived = dictionary[.sell] as? Double,
            let symbolReceived = dictionary[.symbol] as? String
        else {
            return nil
        }
        self.code = code
        self.latePrice = latePriceReceived
        self.recentPrice = recentPriceReceived
        self.buy = buyReceived
        self.sell = sellReceived
        self.symbol = symbolReceived
    }
}
    
public class CodeCoin: Codable {
    var usd: CoinDetail? = nil
    var aud: CoinDetail? = nil
    var brl: CoinDetail? = nil
    var cad: CoinDetail? = nil
    var chf: CoinDetail? = nil
    var clp: CoinDetail? = nil
    var cny: CoinDetail? = nil
    var dkk: CoinDetail? = nil
    var eur: CoinDetail? = nil
    var gbp: CoinDetail? = nil
    var hkd: CoinDetail? = nil
    var inr: CoinDetail? = nil
    var isk: CoinDetail? = nil
    var jpy: CoinDetail? = nil
    var krw: CoinDetail? = nil
    var nzd: CoinDetail? = nil
    var pln: CoinDetail? = nil
    var rub: CoinDetail? = nil
    var sek: CoinDetail? = nil
    var sgd: CoinDetail? = nil
    var thb: CoinDetail? = nil
    var tryCoin: CoinDetail? = nil
    var twd: CoinDetail? = nil
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case aud = "AUD"
        case brl = "BRL"
        case cad = "CAD"
        case chf = "CHF"
        case clp = "CLP"
        case cny = "CNY"
        case dkk = "DKK"
        case eur = "EUR"
        case gbp = "GBP"
        case hkd = "HKD"
        case inr = "INR"
        case isk = "ISK"
        case jpy = "JPY"
        case krw = "KRW"
        case nzd = "NZD"
        case pln = "PLN"
        case rub = "RUB"
        case sek = "SEK"
        case sgd = "SGD"
        case thb = "THB"
        case tryCoin = "TRY"
        case twd = "TWD"
    }
}

//Exemplo
//do {
//    let teste = try JSONDecoder().decode(CodeCoin.self, from: data)
//    print(teste.aud!.buy)
//} catch {
//   print("Error: \(error.localizedDescription)")
//}
