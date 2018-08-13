//
//  KeepRenderer.swift
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

@objc(KeepChartRenderer)
open class KeepRenderer: NSObject
{
    /// the component that handles the drawing area of the chart and it's offsets
    @objc open let viewPortHandler: KeepViewPortHandler

    @objc public init(viewPortHandler: KeepViewPortHandler)
    {
        self.viewPortHandler = viewPortHandler
        super.init()
    }
}
