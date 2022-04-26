//
//  ViewController.swift
//  DYWave
//
//  Created by ekdus0227@gmail.com on 04/12/2022.
//  Copyright (c) 2022 ekdus0227@gmail.com. All rights reserved.
//

import UIKit
import DYWave

class ViewController: UIViewController {
    var waveView: WaveView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.waveView = WaveView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height
            ),
            bgColor: .lightGray,
            maxTime: 3
        )
        
        self.view.insertSubview(self.waveView, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

