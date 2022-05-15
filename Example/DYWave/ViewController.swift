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
    
    var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("reset", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setWaveView()
        self.setStartPauseButtonUI()
        self.setResetButtonUI()
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
        startPauseButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        startPauseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startPauseButton.addTarget(self, action: #selector(didTapStartPauseButton(sender:)), for: .touchUpInside)
    }
    
    private func setResetButtonUI() {
        self.view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        resetButton.leadingAnchor.constraint(equalTo: self.startPauseButton.trailingAnchor, constant: 20).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        resetButton.addTarget(self, action: #selector(didTapResetButton(sender:)), for: .touchUpInside)
    }
    
    @objc func didTapStartPauseButton(sender: UIButton) {
        let state = sender.isSelected
        waveView.shouldStop = !state
        sender.isSelected = !state
        
    }
    
    @objc func didTapResetButton(sender: UIButton) {
        waveView.resetComponents(backgroundColor: .blue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

