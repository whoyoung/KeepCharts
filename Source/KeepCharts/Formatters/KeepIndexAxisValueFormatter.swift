//
//  KeepIndexAxisValueFormatter.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation

/// This formatter is used for passing an array of x-axis labels, on whole x steps.
@objc(KeepChartIndexAxisValueFormatter)
open class KeepIndexAxisValueFormatter: NSObject,  KeepIAxisValueFormatter
{
    private var _values: [String] = [String]()
    private var _valueCount: Int = 0
    
    @objc public var values: [String]
    {
        get
        {
            return _values
        }
        set
        {
            _values = newValue
            _valueCount = _values.count
        }
    }
    
    public override init()
    {
        super.init()
        
    }
    
    @objc public init(values: [String])
    {
        super.init()
        
        self.values = values
    }
    
    @objc public static func with(values: [String]) -> KeepIndexAxisValueFormatter?
    {
        return KeepIndexAxisValueFormatter(values: values)
    }
    
    open func stringForValue(_ value: Double,
                             axis: KeepAxisBase?) -> String
    {
        let index = Int(value.rounded())
        guard values.indices.contains(index), index == Int(value) else { return "" }
        return _values[index]
    }
}