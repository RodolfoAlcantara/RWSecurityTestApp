//
//  RNCryptorViewController.swift
//  RWTestApp
//
//  Created by Rodolfo Benjamin Alcantara Solorio on 06/11/19.
//  Copyright © 2019 Rodolfo Benjamin Alcantara Solorio. All rights reserved.
//

import UIKit
import RNCryptor
import RWSecurity

class RNCryptorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let uuid = UIDevice.current.identifierForVendor?.uuidString else {
            print("No hay uuid")
            return
        }        
        
        print(uuid)
        
        let nombre = "Rodolfo".data(using: .utf8)
        let encryptedData = encrypt(key: uuid, dataToEncrypt: nombre!)
        
        ///////////////////////
        print(String(data: encryptedData, encoding: .utf8) ?? "Parse Error")
        do {
            try KeychainWrapper.set(value: encryptedData, account: "kSecPassword", key: uuid)
        } catch {
            print("error")
        }
        
        //////////////////////
        
        do {
            let returnedData = try decrypt(key: uuid, dataToDecrypt: encryptedData)
            print(String(data: returnedData, encoding: .utf8) ?? "Decoder Error")
        } catch {
            print("error")
        }
        
    }
    
    func encrypt(key: String, dataToEncrypt: Data) -> Data {
        return RNCryptor.encrypt(data: dataToEncrypt, withPassword: key)
    }
    
    func decrypt(key: String, dataToDecrypt: Data) throws -> Data {
        return try RNCryptor.decrypt(data: dataToDecrypt, withPassword: key)
    }
    
}
