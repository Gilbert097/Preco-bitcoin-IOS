//
//  BitcoinService.swift
//  Preco bitcoin
//
//  Created by Gilberto Silva on 13/04/21.
//

import Foundation

public class BitcoinService {
    
    public func requestPriceBitcoin(completion: @escaping (BitcoinDetail?) -> Void) {
        guard
            let url = URL(string: "https://blockchain.info/ticker")
        else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard
                    let data = data,
                    let dataResponse = DataResponse(data: data),
                    let brlCoin = dataResponse.coins.filter({ $0.code == BitcoinCode.brl.rawValue}).first
                else {
                    completion(nil)
                    return
                }
                completion(brlCoin)
            } else {
                completion(nil)
                print("Erro ao fazer a consulta do preço.")
            }
        }
        task.resume()
    }
}
