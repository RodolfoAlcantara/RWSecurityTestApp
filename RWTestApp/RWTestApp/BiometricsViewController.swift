//
//  BiometricsViewController.swift
//  RWTestApp
//
//  Created by Rodolfo Benjamin Alcantara Solorio on 04/11/19.
//  Copyright © 2019 Rodolfo Benjamin Alcantara Solorio. All rights reserved.
//

import UIKit
import LocalAuthentication

class BiometricsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try requestBiometric()
        } catch {
            print(error)
        }
        
    }
    
    func requestBiometric() throws {
        let context = LAContext()
        let localizedReason = "Biometric testing"
        var authError: NSError?
        
        if #available(iOS 8.0, *) {
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: localizedReason) { (success, evaluateError) in
                    DispatchQueue.main.async {
                        if success {
                            print("Correcto")
                        } else {
                            print("Incorrecto")
                        }
                    }
                }
            } else {
                throw ErrorBiometrics.cantEvaluate
            }
        } else {
            throw ErrorBiometrics.notSupported
        }
    }
}

public enum ErrorBiometrics: Error {
    case notSupported
    case cantEvaluate
    case incorrectResult
}
