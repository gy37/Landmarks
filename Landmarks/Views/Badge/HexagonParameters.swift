//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by gaoshenyu on 2022/7/3.
//

import Foundation
import CoreGraphics

struct HexagonParameters {
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    
    static let adjustment: CGFloat = 0.075
    static let segments = [
        Segment(line: CGPoint(x: 0.55, y: 0.03), curve: CGPoint(x: 0.45, y: 0.03), control: CGPoint(x: 0.50, y: 0.0)),
        Segment(line: CGPoint(x: 0.05, y: 0.15 + adjustment),
                curve: CGPoint(x: 0.01, y: 0.25 + adjustment),
                control: CGPoint(x: 0.0, y: 0.2 + adjustment)),
        Segment(line: CGPoint(x: 0.01, y: 0.75 - adjustment),
                curve: CGPoint(x: 0.05, y: 0.85 - adjustment),
                control: CGPoint(x: 0.00, y: 0.8 - adjustment)),
        Segment(line: CGPoint(x: 0.45, y: 0.97), curve: CGPoint(x: 0.55, y: 0.97), control: CGPoint(x: 0.50, y: 1.00)),
        Segment(line: CGPoint(x: 0.95, y: 0.85 - adjustment),
                curve: CGPoint(x: 0.99, y: 0.75 - adjustment),
                control: CGPoint(x: 1.00, y: 0.80 - adjustment)),
        Segment(line: CGPoint(x: 0.99, y: 0.25 + adjustment),
                curve: CGPoint(x: 0.95, y: 0.15 + adjustment),
                control: CGPoint(x: 1.00, y: 0.20 + adjustment)),
    ]
}
