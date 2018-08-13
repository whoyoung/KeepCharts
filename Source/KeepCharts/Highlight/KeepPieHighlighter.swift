//
//  KeepPieHighlighter.swift
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

@objc(KeepPieChartHighlighter)
open class KeepPieHighlighter: KeepPieRadarHighlighter
{
    open override func closestHighlight(index: Int, x: CGFloat, y: CGFloat) -> KeepHighlight?
    {
        guard
            let set = chart?.data?.dataSets[0],
            let entry = set.entryForIndex(index)
            else { return nil }
                
        return KeepHighlight(x: Double(index), y: entry.y, xPx: x, yPx: y, dataSetIndex: 0, axis: set.axisDependency)
    }
}
