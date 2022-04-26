//
//  WavePoints.swift
//  DYWave
//
//  Created by 정다연 on 4/25/22.
//

import Foundation

struct WavePoints {
    private let width: CGFloat
    private let height: CGFloat
    
    private var zeroYPoint: CGFloat         // 줄어드는 물결의 기준 y좌표
    private var heightPeriod: Double        // drawPeriod동안 내려갈 wave의 길이
    private let amplitude: CGFloat          // 위아래로 얼만큼 출렁일 것인가(0.0 ~ 1.0)
    
    private var points: [CGPoint] = []      // 실제 그려질 점들
    
    init(
        width: CGFloat,
        height: CGFloat,
        heightPeriod: Double,
        amplitude: CGFloat,
        zeroYPoint: CGFloat,
        delay: CGFloat = 0
    ) {
        self.width = width
        self.height = height
        self.heightPeriod = heightPeriod
        self.amplitude = amplitude
        self.zeroYPoint = zeroYPoint
        self.points = makePointsToDraw(delay: delay)
    }
    
    private func makePointsToDraw(delay: CGFloat) -> [CGPoint] {
        var points = [CGPoint]()
        let spaceBetweenX: CGFloat = 1
        var currentX: CGFloat = 0
        
        while currentX < width {
            points.append(
                CGPoint(
                    x: currentX,
                    y: zeroYPoint + (width / 10 * amplitude) * sin(delay + currentX * 2 * .pi / width)
                )
            )
            currentX += spaceBetweenX
        }
        
        return points
    }
   
    mutating func moveOneStepPoints() {
        let movedPoints = points.enumerated().map({ (idx, point) -> CGPoint in
            var yToMove =
                point == points.last ?
                points[0].y :
                points[idx + 1].y
            let xToMove =
                point == points.last ?
            width :
                point.x
                
            yToMove += CGFloat(heightPeriod)
            return CGPoint(x: xToMove, y: yToMove)
        })
        self.points = movedPoints
    }

    func path() -> CGPath {
        let path = UIBezierPath()
        
        // 물결을 이루는 점들
        let first = points.first ?? CGPoint(x: 0, y: height)
        path.move(to: CGPoint(x: first.x, y: first.y))
        
        for point in points where point != points.first {
            path.addLine(to: point)
        }
        
        // 오른쪽 아래 포인트
        path.addLine(to: CGPoint(x: width, y: height))
        
        // 왼쪽 아래 포인트
        path.addLine(to: CGPoint(x: 0, y: height))

        return path.cgPath
    }
}
