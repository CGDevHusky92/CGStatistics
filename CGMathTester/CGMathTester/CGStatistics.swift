//
//  CGStatistics.swift
//
//  Created by Charles Gorectke on 7/1/14.
//  Copyright (c) 2014 Revision Works, LLC. All rights reserved.
//

import Foundation

// Typedef unit types... Allows for CGPhysics Library...

class CGStatistics : CGMatrix {
    
    /* View Calculation Variables (Might go into custom Parent UIView object) */
    
    // Height of graph axis images
    
    // Pixel range for class widths
    
    // Number of class widths...
    
    // Fine tuning of class widths for data...
    
    
    /* Class Variables */
    
    // X_max, X_min for each column
    
    // mean, median, mode for each column
    
    // Standard Deviation and Variance variables
    
    
    /* Public Class Functions */
    
    // Custom init
    override init() {
        super.init()
    }
    
    override init(file_name: String) {
        super.init(file_name: file_name)
    }
    
    override func loadDataFromCSVInResourcesWithName(file_name: String, removeLabels: Bool=false) {
        super.loadDataFromCSVInResourcesWithName(file_name, removeLabels: removeLabels)
    }
    
    // Provide delegate and data source protocol for graphs?
    
    // reloadData function
    
    /* Public Debug Functions (Command Line Graphs) */
    func debug_printStemLeafPlot() -> (Double, Int) {
        println(" | ")
        
        return (0.0, 0)
    }
    
    func debug_printHistogram() {
        
    }

    func debug_printBoxPlot() {
        
    }
    
    func debug_printPieChart() {
        
    }
    
    /* Private Class Functions */
    
    // Sturges Law
    func approximateNumberOfClasses() -> Int {
        return Int(1 + (3.322 * log10(CDouble(self.count()))))
    }
}



