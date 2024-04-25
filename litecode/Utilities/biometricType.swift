//
//  biometricType.swift
//  litecode
//
//  Created by Krisna Pranav on 25/04/24.
//

import Foundation
import LocalAuthentication

func biometricAuthSupported() -> Bool {
    let authContext = LAContext()
    return authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
}
