//
//  KeepBubbleChartView.swift
//  Charts
//
//  Bubble chart implementation:
//    Copyright 2015 Pierre-Marc Airoldi
//    Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

open class KeepBubbleChartView: KeepBarLineChartViewBase, KeepBubbleChartDataProvider
{
    open override func initialize()
    {
        super.initialize()
        
        renderer = KeepBubbleChartRenderer(dataProvider: self, animator: _animator, viewPortHandler: _viewPortHandler)
    }
    
    // MARK: - KeepBubbleChartDataProvider
    
    open var bubbleData: KeepBubbleChartData? { return _data as? KeepBubbleChartData }
}
