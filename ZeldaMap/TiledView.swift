//
//  TiledView.swift
//  ZeldaMap
//
//  Created by Luo Sheng on 21/04/2017.
//  Copyright © 2017 Pop Tap. All rights reserved.
//

import UIKit

class TiledView: UIView {

    static let tileSize = CGSize(width: 750, height: 625)

    var level: Int = 0 {
        didSet {
            count = Int(pow(2.0, Double(level)))
            DispatchQueue.main.async {
                self.sizeToFit()
                self.setNeedsDisplay()
            }
        }
    }

    var count = 0

    override class var layerClass: AnyClass {
        return CATiledLayer.self
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        srand48(Int(NSDate().timeIntervalSince1970))
        if let layer = self.layer as? CATiledLayer {
            layer.tileSize = TiledView.tileSize
        }

        defer {
            level = 1
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: Int(TiledView.tileSize.width) * count, height: Int(TiledView.tileSize.height) * count)
    }

    private func findCoordinate(by rect: CGRect) -> (Int, Int) {
        let scale = UIScreen.main.scale
        let originalX = Int(rect.origin.x * scale)
        let originalY = Int(rect.origin.y * scale)
        let i = originalX / Int(TiledView.tileSize.width)
        let j = originalY / Int(TiledView.tileSize.height)
        return (i, j)
    }
}
