//
//  BiometricsViewController.swift
//  RWTestApp
//
//  Created by Rodolfo Benjamin Alcantara Solorio on 04/11/19.
//  Copyright © 2019 Rodolfo Benjamin Alcantara Solorio. All rights reserved.
//

import UIKit
import LocalAuthentication
import RWSecurity

class BiometricsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try BiometricWrapper.requestBiometric(handler: { (success, error) in
                if(success){
                    print("You're the fucking owner")
                }else{
                    print("You thief!!")
                }
            })
        } catch {
            print(error)
        }
        
    }
    

}


