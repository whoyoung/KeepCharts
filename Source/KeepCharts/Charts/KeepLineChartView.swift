//
//  KeepLineChartView.swift
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

/// Chart that draws lines, surfaces, circles, ...
open class KeepLineChartView: KeepBarLineChartViewBase, KeepLineChartDataProvider
{
    internal override func initialize()
    {
        super.initialize()
        
        renderer = KeepLineChartRenderer(dataProvider: self, animator: _animator, viewPortHandler: _viewPortHandler)
    }
    
    // MARK: - KeepLineChartDataProvider
    
    open var lineData: KeepLineChartData? { return _data as? KeepLineChartData }
}
