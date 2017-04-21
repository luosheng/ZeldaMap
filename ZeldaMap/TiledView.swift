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
            layer.tileSize = CGSize(width: 750, height: 625)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        let (i, j) = findCoordinate(by: rect)
        guard let imageUrl = Bundle.main.url(forResource: "\(i)-\(j)", withExtension: "png", subdirectory: "Maps/1o"),
            let data = try? Data(contentsOf: imageUrl),
            let image = UIImage(data: data, scale: UIScreen.main.scale) else {
                return
        }
        image.draw(at: rect.origin)
    }

    private func findCoordinate(by rect: CGRect) -> (Int, Int) {
        guard let layer = self.layer as? CATiledLayer else {
            return (-1, -1)
        }

        let scale = UIScreen.main.scale
        let originalX = Int(rect.origin.x * scale)
        let originalY = Int(rect.origin.y * scale)
        let i = originalX / Int(layer.tileSize.width)
        let j = originalY / Int(layer.tileSize.height)
        return (i, j)
    }
}
