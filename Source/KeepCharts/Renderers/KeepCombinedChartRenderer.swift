//
//  KeepCombinedChartRenderer.swift
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

open class KeepCombinedChartRenderer: KeepDataRenderer
{
    @objc open weak var chart: KeepCombinedChartView?
    
    /// if set to true, all values are drawn above their bars, instead of below their top
    @objc open var drawValueAboveBarEnabled = true
    
    /// if set to true, a grey area is drawn behind each bar that indicates the maximum value
    @objc open var drawBarShadowEnabled = false
    
    internal var _renderers = [KeepDataRenderer]()
    
    internal var _drawOrder: [KeepCombinedChartView.DrawOrder] = [.bar, .bubble, .line, .candle, .scatter]
    
    @objc public init(chart: KeepCombinedChartView, animator: KeepAnimator, viewPortHandler: KeepViewPortHandler)
    {
        super.init(animator: animator, viewPortHandler: viewPortHandler)
        
        self.chart = chart
        
        createRenderers()
    }
    
    /// Creates the renderers needed for this combined-renderer in the required order. Also takes the DrawOrder into consideration.
    internal func createRenderers()
    {
        _renderers = [KeepDataRenderer]()
        
        guard let chart = chart else { return }

        for order in drawOrder
        {
            switch (order)
            {
            case .bar:
                if chart.barData !== nil
                {
                    _renderers.append(KeepBarChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
                break
                
            case .line:
                if chart.lineData !== nil
                {
                    _renderers.append(KeepLineChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                    
                }
                break
                
            case .candle:
                if chart.candleData !== nil
                {
                    _renderers.append(KeepCandleStickChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
                break
                
            case .scatter:
                if chart.scatterData !== nil
                {
                    _renderers.append(KeepScatterChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
                break
                
            case .bubble:
                if chart.bubbleData !== nil
                {
                    _renderers.append(KeepBubbleChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                    
                }
                break
            }
        }

    }
    
    open override func initBuffers()
    {
        for renderer in _renderers
        {
            renderer.initBuffers()
        }
    }
    
    open override func drawData(context: CGContext)
    {
        for renderer in _renderers
        {
            renderer.drawData(context: context)
        }
    }
    
    open override func drawValues(context: CGContext)
    {
        for renderer in _renderers
        {
            renderer.drawValues(context: context)
        }
    }
    
    open override func drawExtras(context: CGContext)
    {
        for renderer in _renderers
        {
            renderer.drawExtras(context: context)
        }
    }
    
    open override func drawHighlighted(context: CGContext, indices: [KeepHighlight])
    {
        for renderer in _renderers
        {
            var data: KeepChartData?
            
            if renderer is KeepBarChartRenderer
            {
                data = (renderer as! KeepBarChartRenderer).dataProvider?.barData
            }
            else if renderer is KeepLineChartRenderer
            {
                data = (renderer as! KeepLineChartRenderer).dataProvider?.lineData
            }
            else if renderer is KeepCandleStickChartRenderer
            {
                data = (renderer as! KeepCandleStickChartRenderer).dataProvider?.candleData
            }
            else if renderer is KeepScatterChartRenderer
            {
                data = (renderer as! KeepScatterChartRenderer).dataProvider?.scatterData
            }
            else if renderer is KeepBubbleChartRenderer
            {
                data = (renderer as! KeepBubbleChartRenderer).dataProvider?.bubbleData
            }
            
            let dataIndex = data == nil ? nil : (chart?.data as? KeepCombinedChartData)?.allData.index(of: data!)
            
            let dataIndices = indices.filter{ $0.dataIndex == dataIndex || $0.dataIndex == -1 }
            
            renderer.drawHighlighted(context: context, indices: dataIndices)
        }
    }

    /// - returns: The sub-renderer object at the specified index.
    @objc open func getSubRenderer(index: Int) -> KeepDataRenderer?
    {
        if index >= _renderers.count || index < 0
        {
            return nil
        }
        else
        {
            return _renderers[index]
        }
    }

    /// - returns: All sub-renderers.
    @objc open var subRenderers: [KeepDataRenderer]
    {
        get { return _renderers }
        set { _renderers = newValue }
    }
    
    // MARK: Accessors
    
    /// - returns: `true` if drawing values above bars is enabled, `false` ifnot
    @objc open var isDrawValueAboveBarEnabled: Bool { return drawValueAboveBarEnabled }
    
    /// - returns: `true` if drawing shadows (maxvalue) for each bar is enabled, `false` ifnot
    @objc open var isDrawBarShadowEnabled: Bool { return drawBarShadowEnabled }
    
    /// the order in which the provided data objects should be drawn.
    /// The earlier you place them in the provided array, the further they will be in the background.
    /// e.g. if you provide [DrawOrder.Bar, DrawOrder.Line], the bars will be drawn behind the lines.
    open var drawOrder: [KeepCombinedChartView.DrawOrder]
    {
        get
        {
            return _drawOrder
        }
        set
        {
            if newValue.count > 0
            {
                _drawOrder = newValue
            }
        }
    }
}
