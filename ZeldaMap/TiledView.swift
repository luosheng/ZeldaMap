//
//  TiledView.swift
//  ZeldaMap
//
//  Created by Luo Sheng on 21/04/2017.
//  Copyright © 2017 Pop Tap. All rights reserved.
//

import UIKit

class TiledView: UIView {

    override class var layerClass: AnyClass {
        return CATiledLayer.self
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        srand48(Int(NSDate().timeIntervalSince1970))
        if let layer = self.layer as? CATiledLayer {
            layer.tileSize = CGSize(width: 50, height: 50)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        srand48(Int(NSDate().timeIntervalSince1970))
        if let layer = self.layer as? CATiledLayer {
            layer.tileSize = CGSize(width: 50, height: 50)
        }
    }

    override func draw(_ rect: CGRect) {
        print(rect)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        context.setFillColor(red: red, green: green, blue: blue, alpha: 1.0)
        context.fill(rect)
    }
}
