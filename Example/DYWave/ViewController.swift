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
    
    var startPauseButton: UIButton = {
        let button = UIButton()
        button.setTitle("start/pause", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setWaveView()
        self.setStartPauseButtonUI()
    }
    
    private func setWaveView() {
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
    }
    
    private func setStartPauseButtonUI() {
        self.view.addSubview(startPauseButton)
        startPauseButton.translatesAutoresizingMaskIntoConstraints = false
        startPauseButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        startPauseButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        startPauseButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -200).isActive = true
        startPauseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startPauseButton.addTarget(self, action: #selector(didTap(sender:)), for: .touchUpInside)
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

