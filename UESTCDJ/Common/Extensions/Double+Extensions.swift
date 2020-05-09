//
//  Double+Extensions.swift
//  ccwpa
//
//  Created by JLM on 2020/5/9.
//  Copyright © 2019 MarcoLi. All rights reserved.
//

import Foundation
extension Double {
    public func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
