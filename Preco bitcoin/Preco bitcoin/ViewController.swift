//
//  ViewController.swift
//  Preco bitcoin
//
//  Created by Gilberto Silva on 11/04/21.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://blockchain.info/ticker") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard
                    let data = data,
                    let dataResponse = DataResponse(data: data)
                else { return }
                
                if let brlCoin = dataResponse.coins.filter({ $0.code == CodeCoins.brl.rawValue}).first {
                    
                    let nf = NumberFormatter()
                    nf.numberStyle = .decimal
                    nf.locale = Locale(identifier: "pt_BR")
                    //nf.groupingSeparator = "."
                    //nf.decimalSeparator = ","
                    guard let result = nf.string(from: NSNumber(value: brlCoin.latePrice)) else { return }
                    
                    print("Code: \(brlCoin.code), LatePrice: \(result)")
                }
            } else {
                print("Erro ao fazer a consulta do preço.")
            }
        }
        task.resume()
    }
}
