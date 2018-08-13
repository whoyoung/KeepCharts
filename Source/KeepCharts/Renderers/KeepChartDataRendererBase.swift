//
//  KeepDataRenderer.swift
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

@objc(KeepChartDataRendererBase)
open class KeepDataRenderer: KeepRenderer
{
    @objc open let animator: KeepAnimator
    
    @objc public init(animator: KeepAnimator, viewPortHandler: KeepViewPortHandler)
    {
        self.animator = animator

        super.init(viewPortHandler: viewPortHandler)
    }

    @objc open func drawData(context: CGContext)
    {
        fatalError("drawData() cannot be called on KeepDataRenderer")
    }
    
    @objc open func drawValues(context: CGContext)
    {
        fatalError("drawValues() cannot be called on KeepDataRenderer")
    }
    
    @objc open func drawExtras(context: CGContext)
    {
        fatalError("drawExtras() cannot be called on KeepDataRenderer")
    }
    
    /// Draws all highlight indicators for the values that are currently highlighted.
    ///
    /// - parameter indices: the highlighted values
    @objc open func drawHighlighted(context: CGContext, indices: [KeepHighlight])
    {
        fatalError("drawHighlighted() cannot be called on KeepDataRenderer")
    }
    
    /// An opportunity for initializing internal buffers used for rendering with a new size.
    /// Since this might do memory allocations, it should only be called if necessary.
    @objc open func initBuffers() { }
    
    @objc open func isDrawingValuesAllowed(dataProvider: KeepChartDataProvider?) -> Bool
    {
        guard let data = dataProvider?.data else { return false }
        return data.entryCount < Int(CGFloat(dataProvider?.maxVisibleCount ?? 0) * viewPortHandler.scaleX)
    }
}
