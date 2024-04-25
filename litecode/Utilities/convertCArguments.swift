//
//  convertCArguments.swift
//  litecode
//
//  Created by Krisna Pranav on 25/04/24.
//

import Foundation

func convertCArguments(argc: Int32, argv: UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>?)
    -> [String]?
{
    var args = [String]()
    
    for i in 0..<Int(argc) {
        guard let argC = argv?[i] else {
            return nil
        }
        
        let arg = String(cString: argC)
        
        args.append(arg)
    }
    
    return args
}
