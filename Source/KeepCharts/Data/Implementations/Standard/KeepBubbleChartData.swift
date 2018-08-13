//
//  KeepBubbleChartData.swift
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

open class KeepBubbleChartData: KeepBarLineScatterCandleBubbleChartData
{
    public override init()
    {
        super.init()
    }
    
    public override init(dataSets: [KeepIChartDataSet]?)
    {
        super.init(dataSets: dataSets)
    }
    
    /// Sets the width of the circle that surrounds the bubble when highlighted for all DataSet objects this data object contains
    @objc open func setHighlightCircleWidth(_ width: CGFloat)
    {
        (_dataSets as? [KeepIBubbleChartDataSet])?.forEach { $0.highlightCircleWidth = width }
    }
}
