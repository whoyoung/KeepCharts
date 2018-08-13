//
//  KeepScatterChartDataSet.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

open class KeepScatterChartDataSet: KeepLineScatterCandleRadarChartDataSet, KeepIScatterChartDataSet
{
    
    @objc(KeepScatterShape)
    public enum Shape: Int
    {
        case square
        case circle
        case triangle
        case cross
        case x
        case chevronUp
        case chevronDown
    }
    
    /// The size the scatter shape will have
    open var scatterShapeSize = CGFloat(10.0)
    
    /// The radius of the hole in the shape (applies to Square, Circle and Triangle)
    /// **default**: 0.0
    open var scatterShapeHoleRadius: CGFloat = 0.0
    
    /// Color for the hole in the shape. Setting to `nil` will behave as transparent.
    /// **default**: nil
    open var scatterShapeHoleColor: NSUIColor? = nil
    
    /// Sets the ScatterShape this DataSet should be drawn with.
    /// This will search for an available KeepIShapeRenderer and set this renderer for the DataSet
    @objc open func setScatterShape(_ shape: Shape)
    {
        self.shapeRenderer = KeepScatterChartDataSet.renderer(forShape: shape)
    }
    
    /// The KeepIShapeRenderer responsible for rendering this DataSet.
    /// This can also be used to set a custom KeepIShapeRenderer aside from the default ones.
    /// **default**: `SquareShapeRenderer`
    open var shapeRenderer: KeepIShapeRenderer? = KeepSquareShapeRenderer()
    
    @objc open class func renderer(forShape shape: Shape) -> KeepIShapeRenderer
    {
        switch shape
        {
        case .square: return KeepSquareShapeRenderer()
        case .circle: return KeepCircleShapeRenderer()
        case .triangle: return KeepTriangleShapeRenderer()
        case .cross: return KeepCrossShapeRenderer()
        case .x: return KeepXShapeRenderer()
        case .chevronUp: return KeepChevronUpShapeRenderer()
        case .chevronDown: return KeepChevronDownShapeRenderer()
        }
    }
    
    // MARK: NSCopying
    
    open override func copyWithZone(_ zone: NSZone?) -> AnyObject
    {
        let copy = super.copyWithZone(zone) as! KeepScatterChartDataSet
        copy.scatterShapeSize = scatterShapeSize
        copy.scatterShapeHoleRadius = scatterShapeHoleRadius
        copy.scatterShapeHoleColor = scatterShapeHoleColor
        copy.shapeRenderer = shapeRenderer
        return copy
    }
}
