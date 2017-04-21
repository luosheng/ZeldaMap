//
//  ViewController.swift
//  ZeldaMap
//
//  Created by Luo Sheng on 21/04/2017.
//  Copyright © 2017 Pop Tap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tiledView: TiledView!

    override func loadView() {
        view = UIScrollView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tiledView = TiledView()
        if let scrollView = view as? UIScrollView {
            scrollView.addSubview(tiledView)
            DispatchQueue.main.async {
                scrollView.contentSize = self.tiledView.bounds.size
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

