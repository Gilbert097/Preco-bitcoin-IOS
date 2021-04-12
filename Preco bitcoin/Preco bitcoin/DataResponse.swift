//
//  DataResponse.swift
//  Preco bitcoin
//
//  Created by Gilberto Silva on 11/04/21.
//

import Foundation

public class DataResponse {
    let coins: [CoinDetail]
    
    public init?(data: Data){
        do {
            guard
                let objectJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            else { return nil}
            
            self.coins = objectJson.map { (item) -> CoinDetail in
                let (key, value) = item
                guard
                    let coinDictionary = value as? [String: Any]
                else { return CoinDetail(code: key, dictionary: [:]) }
                return CoinDetail(code: key, dictionary: coinDictionary)
            }
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
