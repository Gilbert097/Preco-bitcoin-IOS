//
//  CodeCoin.swift
//  Preco bitcoin
//
//  Created by Gilberto Silva on 11/04/21.
//

import Foundation

public class BitcoinResponse: Codable {
    var usd: BitcoinDetail? = nil
    var aud: BitcoinDetail? = nil
    var brl: BitcoinDetail? = nil
    var cad: BitcoinDetail? = nil
    var chf: BitcoinDetail? = nil
    var clp: BitcoinDetail? = nil
    var cny: BitcoinDetail? = nil
    var dkk: BitcoinDetail? = nil
    var eur: BitcoinDetail? = nil
    var gbp: BitcoinDetail? = nil
    var hkd: BitcoinDetail? = nil
    var inr: BitcoinDetail? = nil
    var isk: BitcoinDetail? = nil
    var jpy: BitcoinDetail? = nil
    var krw: BitcoinDetail? = nil
    var nzd: BitcoinDetail? = nil
    var pln: BitcoinDetail? = nil
    var rub: BitcoinDetail? = nil
    var sek: BitcoinDetail? = nil
    var sgd: BitcoinDetail? = nil
    var thb: BitcoinDetail? = nil
    var tryCoin: BitcoinDetail? = nil
    var twd: BitcoinDetail? = nil
    
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
