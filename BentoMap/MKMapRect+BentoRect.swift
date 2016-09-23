//
//  MKMapRect+BentoRect.swift
// BentoMap
//
//  Created by Matthew Buckley on 8/27/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import Foundation
import MapKit

extension MKMapRect: BentoRect {

    public var minX: CGFloat {
        return CGFloat(MKMapRectGetMinX(self))
    }

    public var minY: CGFloat {
        return CGFloat(MKMapRectGetMinY(self))
    }

    public var maxX: CGFloat {
        return CGFloat(MKMapRectGetMaxX(self))
    }

    public var maxY: CGFloat {
        return CGFloat(MKMapRectGetMaxY(self))
    }

    public func containsCoordinate(c: BentoCoordinate) -> Bool {
        let originCoordinate = MKMapPoint(x: Double(c.x), y: Double(c.y))
        return MKMapRectContainsPoint(self, originCoordinate)
    }

    public func divide(percent: CGFloat, edge: CGRectEdge) -> (MKMapRect, MKMapRect) {
        let amount: Double
        switch edge {
        case .MaxXEdge, .MinXEdge:
            amount = size.width / 2.0
        case .MaxYEdge, .MinYEdge:
            amount = size.height / 2.0
        }

        let slice = UnsafeMutablePointer<MKMapRect>.alloc(1)
        defer {
            slice.destroy()
        }
        let remainder = UnsafeMutablePointer<MKMapRect>.alloc(1)
        defer {
            remainder.destroy()
        }
        MKMapRectDivide(self, slice, remainder, amount, edge)
        return (slice: slice[0], remainder: remainder[0])
    }

    public func unionWith(other: MKMapRect) -> MKMapRect {
        return MKMapRectUnion(self, other)
    }

    public init(originCoordinate origin: BentoCoordinate, size: CGSize) {
        self.init(origin: MKMapPoint(x: Double(origin.x), y: Double(origin.y)), size: MKMapSize(width: Double(size.width), height: Double(size.height)))
    }

}
