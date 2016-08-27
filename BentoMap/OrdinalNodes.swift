//
//  OrdinalNodes.swift
//  BentoMap
//
//  Created by Michael Skiba on 2/17/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import Foundation

struct OrdinalNodes<NodeData, R: BentoRect, C: BentoCoordinate> {

    private typealias QuadTreeWrapper = QuadrantWrapper<QuadTree<NodeData, R, C>>

    // Recursive structs require boxes
    private var quadrants: Box<QuadTreeWrapper>

    var northWest: QuadTree<NodeData, R, C> {
        get {
            return quadrants.value.northWest
        }
        set {
            quadrants.value.northWest = newValue
        }
    }

    var northEast: QuadTree<NodeData, R, C> {
        get {
            return quadrants.value.northEast
        }
        set {
            quadrants.value.northEast = newValue
        }
    }

    var southWest: QuadTree<NodeData, R, C> {
        get {
            return quadrants.value.southWest
        }
        set {
            quadrants.value.southWest = newValue
        }
    }

    var southEast: QuadTree<NodeData, R, C> {
        get {
            return quadrants.value.southEast
        }
        set {
            quadrants.value.southEast = newValue
        }
    }

    init(northWest: QuadTree<NodeData, R, C>,
         northEast: QuadTree<NodeData, R, C>,
         southWest: QuadTree<NodeData, R, C>,
         southEast: QuadTree<NodeData, R, C>) {
        quadrants = Box(value: QuadrantWrapper(northWest: northWest, northEast: northEast, southWest: southWest, southEast: southEast))
    }
}
