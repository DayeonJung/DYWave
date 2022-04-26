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
            maxTime: 3,
            zeroYPoint: 0
        )
        self.view.insertSubview(self.waveView, at: 0)
        
        let button = UIButton()
        button.backgroundColor = .darkGray
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.addTarget(self, action: #selector(didTap(sender:)), for: .touchUpInside)
    }
    
    @objc func didTap(sender: UIButton) {
        let state = sender.isSelected
        waveView.shouldStop = !state
        sender.isSelected = !state
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

