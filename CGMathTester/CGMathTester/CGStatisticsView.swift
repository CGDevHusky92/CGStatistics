//
//  CGStatisticsView.swift
//  CGMathTester
//
//  Created by Charles Gorectke on 8/4/14.
//  Copyright (c) 2014 Revision Works, LLC. All rights reserved.
//

import UIKit


@IBDesignable
class CGStatisticsView : UIView {
    /* View IBOutlets */
    
    // Parent UIView (Just a call to superview)
    
    // Axis Labels
    @IBOutlet var xAxisLabel: UILabel?
    @IBOutlet var yAxisLabel: UILabel?
    
    // Unit Labels Array
    
    // Axis UIImageViews? Or Drawn in Custom Parent UIView (whichever provides least amount of overhead
    
    // Bars and other graph descriptions... Draw?? <- Probably would look best, but may provide the most overhead (Just a function of range and units to pixels...
    // Stacked images may provide less overhead with caching, but less accuracy and may give an odd looking display with overlap...
    
    
    /* View Calculation Variables (Might go into custom Parent UIView object) */
    
    // Height of graph axis images
    
    // Pixel range for class widths
    
    // Number of class widths...
    
    // Fine tuning of class widths for data...
    
    
    /* Class Variables */
    
    // X_max, X_min for each column
    
    // mean, median, mode for each column
    
    // Standard Deviation and Variance variables
    
    init(frame: CGRect) {
        super.init(frame: frame)
    }
}