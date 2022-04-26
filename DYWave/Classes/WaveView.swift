//
//  WaveView.swift
//  DYWave
//
//  Created by 정다연 on 4/25/22.
//

import UIKit

public class WaveView: UIView {

    private var frontWaveLayer = CAShapeLayer()
    private var frontPoints: WavePoints! {
        didSet {
            self.frontWaveLayer.path = self.frontPoints.path()
        }
    }
    
    private var backWaveLayer = CAShapeLayer()
    private var backPoints: WavePoints! {
        didSet {
            self.backWaveLayer.path = self.backPoints.path()
        }
    }
    
    private var drawPeriod: Double = 0.004  // Layer를 몇초에 한 번 랜더링할 것인가
    private var timer = Timer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("Interface Builder로 WaveView를 만들 수 없습니다.")
    }

    required public init(
        frame: CGRect,
        bgColor: UIColor,
        maxTime: Int
    ) {
        super.init(frame: frame)
        self.commoninit(
            maxTime: maxTime,
            backgroundColor: bgColor
        )
    }
    
    private func commoninit(
        maxTime: Int,
        backgroundColor: UIColor
    ) {
        let width = self.frame.width
        let height = self.frame.height
        let amplitude = 0.5
        let zeroYPoint = 0.0
        let heightPeriod = Double(height)/(Double(maxTime)/self.drawPeriod)
        
        self.frontPoints = WavePoints(
            width: width,
            height: height,
            heightPeriod: heightPeriod,
            amplitude: amplitude,
            zeroYPoint: zeroYPoint
        )
        self.frontWaveLayer.fillColor = backgroundColor.cgColor
        self.layer.addSublayer(self.frontWaveLayer)
        
        self.backPoints = WavePoints(
            width: width,
            height: height,
            heightPeriod: heightPeriod,
            amplitude: amplitude,
            zeroYPoint: zeroYPoint,
            delay: 2 * .pi/4
        )
        self.backWaveLayer.fillColor = backgroundColor.withAlphaComponent(0.5).cgColor
        self.layer.insertSublayer(self.backWaveLayer, at: 0)

        self.startAnimation()
    }
    
    public override func draw(_ rect: CGRect) {
        self.frontPoints.moveOneStepPoints()
        self.backPoints.moveOneStepPoints()
    }
    
    private func startAnimation() {
        self.timer = Timer.scheduledTimer(
            timeInterval: self.drawPeriod,
            target: self,
            selector: #selector(waveAnimation),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc private func waveAnimation() {
        self.setNeedsDisplay()
    }
}
