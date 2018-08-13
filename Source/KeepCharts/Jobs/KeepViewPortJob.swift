//
//  KeepViewPortJob.swift
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

// This defines a viewport modification job, used for delaying or animating viewport changes
@objc(KeepChartViewPortJob)
open class KeepViewPortJob: NSObject
{
    internal var point: CGPoint = CGPoint()
    internal weak var viewPortHandler: KeepViewPortHandler?
    internal var xValue: Double = 0.0
    internal var yValue: Double = 0.0
    internal weak var transformer: KeepTransformer?
    internal weak var view: KeepChartViewBase?
    
    @objc public init(
        viewPortHandler: KeepViewPortHandler,
        xValue: Double,
        yValue: Double,
        transformer: KeepTransformer,
        view: KeepChartViewBase)
    {
        super.init()
        
        self.viewPortHandler = viewPortHandler
        self.xValue = xValue
        self.yValue = yValue
        self.transformer = transformer
        self.view = view
    }
    
    @objc open func doJob()
    {
        fatalError("`doJob()` must be overridden by subclasses")
    }
}
