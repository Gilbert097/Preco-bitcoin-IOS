//
//  ViewController.swift
//  Preco bitcoin
//
//  Created by Gilberto Silva on 11/04/21.
//

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
                
                print(dataResponse.coins.count)
            } else {
                print("Erro ao fazer a consulta do preço.")
            }
        }
        task.resume()
    }
}
