//
//  RGB.swift
//  Eat_Today
//
//  Created by KPUGAME on 2021/06/05.
//

import Foundation
import UIKit

extension UIColor {
  convenience init(rgbStruct rgb: RGB) {
    let r = CGFloat(rgb.r) / 255.0
    let g = CGFloat(rgb.g) / 255.0
    let b = CGFloat(rgb.b) / 255.0
    self.init(red: r, green: g, blue: b, alpha:1.0)
  }
    
    convenience init(colorStruct color: Color) {
        let r = CGFloat(color.r) / 255.0
        let g = CGFloat(color.g) / 255.0
        let b = CGFloat(color.b) / 255.0
        self.init(red: r, green: g, blue: b, alpha:1.0)
    }
}

struct RGB {
  var r = 256
  var g = 256
  var b = 256
  
  func difference(target: RGB) -> Double {
    let rDiff = Double(r - target.r)
    let gDiff = Double(g - target.g)
    let bDiff = Double(b - target.b)
    return sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff) / 256.0
  }
}
