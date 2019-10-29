//
//  ViewController.swift
//  RWTestApp
//
//  Created by Rodolfo Benjamin Alcantara Solorio on 28/10/19.
//  Copyright © 2019 Rodolfo Benjamin Alcantara Solorio. All rights reserved.
//

import UIKit
import RWSecurity

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let nombre = "Rodolfo".data(using: .utf8)
        
        do {
            let nombreData = try KeychainWrapper.get(account: "Nombre")
            print(String(data: nombreData!, encoding: .utf8)!)
        } catch {
            print("Error")
        }
        
        
        do {
            try KeychainWrapper.set(value: nombre!, account: "Nombre")
        } catch {
            print("Error")
        }
        
        do {
            let nombreData = try KeychainWrapper.get(account: "Nombre")
            print(String(data: nombreData!, encoding: .utf8)!)
        } catch {
            print("Error")
        }
        
        do {
            try KeychainWrapper.deleteAll()
        } catch {
            print("Error")
        }
        
    }
    

}

