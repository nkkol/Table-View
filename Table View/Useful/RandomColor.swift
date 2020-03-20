//
//  RandomColor.swift
//  Table View
//
//  Created by Inna Litvinenko on 3/21/20.
//  Copyright © 2020 Inna Litvinenko. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

