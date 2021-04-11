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
        
        guard  let url = URL(string: "https://blockchain.info/ticker") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                print("Sucesso ao fazer a consulta do preço.")
            } else {
                print("Erro ao fazer a consulta do preço.")
            }
        }
        task.resume()
        
    }


}

