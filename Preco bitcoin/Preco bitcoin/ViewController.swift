//
//  ViewController.swift
//  Preco bitcoin
//
//  Created by Gilberto Silva on 11/04/21.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var priceBitcoinLabel: UILabel!
    @IBOutlet weak var refreshPriceButton: UIButton!
    private let bitcoinService = BitcoinService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshPrice()
    }
    
    @IBAction func refreshPriceClick(_ sender: UIButton) {
        refreshPrice()
    }
    
    private func refreshPrice() {
        refreshPriceButton.setTitle("Atualizando...", for: .normal)
        bitcoinService.requestPriceBitcoin { [weak self] (bitcoinBrl) in
            guard
                let self = self,
                let bitcoinBrl = bitcoinBrl,
                let result = self.formartBitcoinPrice(priceBitcoin: bitcoinBrl.latePrice)
            else {
                return
            }
            
            DispatchQueue.main.async {
                self.refreshPriceButton.setTitle("Atualizar", for: .normal)
                self.priceBitcoinLabel.text = "\(bitcoinBrl.symbol) \(result)"
            }
            
            print("Code: \(bitcoinBrl.code), LatePrice: \(result)")
        }
    }
    
    private func formartBitcoinPrice(priceBitcoin: Double) -> String? {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.locale = Locale(identifier: "pt_BR")
        return nf.string(from: NSNumber(value: priceBitcoin))
    }
    
}
