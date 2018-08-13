//
//  KeepCombinedHighlighter.swift
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

@objc(KeepCombinedChartHighlighter)
open class KeepCombinedHighlighter: KeepChartHighlighter
{
    /// bar highlighter for supporting stacked highlighting
    private var barHighlighter: KeepBarHighlighter?
    
    @objc public init(chart: KeepCombinedChartDataProvider, barDataProvider: KeepBarChartDataProvider)
    {
        super.init(chart: chart)
        
        // if there is BarData, create a KeepBarHighlighter
        self.barHighlighter = barDataProvider.barData == nil ? nil : KeepBarHighlighter(chart: barDataProvider)
    }
    
    open override func getHighlights(xValue: Double, x: CGFloat, y: CGFloat) -> [KeepHighlight]
    {
        var vals = [KeepHighlight]()
        
        guard
            let chart = self.chart as? KeepCombinedChartDataProvider,
            let dataObjects = chart.combinedData?.allData
            else { return vals }
        
        for i in 0..<dataObjects.count
        {
            let dataObject = dataObjects[i]

            // in case of BarData, let the KeepBarHighlighter take over
            if barHighlighter != nil && dataObject is KeepBarChartData,
                let high = barHighlighter?.getHighlight(x: x, y: y)
            {
                high.dataIndex = i
                vals.append(high)
            }
            else
            {
                for j in 0..<dataObject.dataSetCount
                {
                    guard let dataSet = dataObject.getDataSetByIndex(j),
                        dataSet.isHighlightEnabled      // don't include datasets that cannot be highlighted
                        else { continue }

                    let highs = buildHighlights(dataSet: dataSet, dataSetIndex: j, xValue: xValue, rounding: .closest)

                    for high in highs
                    {
                        high.dataIndex = i
                        vals.append(high)
                    }
                }
            }
        }
        
        return vals
    }
}
