//
//  CGMatrix.swift
//
//  Created by Charles Gorectke on 7/1/14.
//  Copyright (c) 2014 Revision Works, LLC. All rights reserved.
//

import Foundation


/* Global operators for Matrices */

// Addition
func += (inout left: CGMatrix, right: CGMatrix) {
    if left.rowCount() != right.rowCount() || left.columnCount() != right.columnCount() { return }
    for rowIndex in 0..<left.rowCount() {
        for colIndex in 0..<left.columnCount() {
            left[rowIndex, colIndex] += right[rowIndex, colIndex]
        }
    }
}

// Subtraction
func -= (inout left: CGMatrix, right: CGMatrix) {
    if left.rowCount() != right.rowCount() || left.columnCount() != right.columnCount() { return }
    left.largestSignificantDigits = 0
    for rowIndex in 0..<left.rowCount() {
        for colIndex in 0..<left.columnCount() {
            left[rowIndex, colIndex] -= right[rowIndex, colIndex]
        }
    }
}

// Multiplication
func *= (inout left: CGMatrix, right: CGMatrix) {
    
}

// Division
func /= (inout left: CGMatrix, right: CGMatrix) {
    
}

/* Equality Functions */
 func == (left: CGMatrix, right: CGMatrix) -> Bool {
    if left.rowCount() != right.rowCount() || left.columnCount() != right.columnCount() { return false }
    for rowIndex in 0..<left.rowCount() {
        for colIndex in 0..<left.columnCount() {
            if left[rowIndex, colIndex] != right[rowIndex, colIndex] { return false }
        }
    }
    return true
}

func != (left: CGMatrix, right: CGMatrix) -> Bool {
    if left.rowCount() != right.rowCount() || left.columnCount() != right.columnCount() { return true }
    for rowIndex in 0..<left.rowCount() {
        for colIndex in 0..<left.columnCount() {
            if left[rowIndex, colIndex] != right[rowIndex, colIndex] { return true }
        }
    }
    return false
}

class CGMatrix {
    
    /* Class Variables and Properties */
    
    // Mutable Matrix based on array...
    var matrix = [Double]()
    
    // Mutable row, col count arrays
    var row_totals = [Double]()
    var col_totals = [Double]()
    
    var row_labels = [String]()
    var col_labels = [String]()
    
    var largestSignificantDigits: Int
    var warnings: Bool
    var calculateRows: Bool
    
    
    // Num open spaces? Fixed rows/cols?
    
    init() {
        self.largestSignificantDigits = 0
        self.warnings = true
        self.calculateRows = true;
    }
    
    init(file_name: String) {
        self.largestSignificantDigits = 0
        self.warnings = true
        self.calculateRows = true;
        self.loadDataFromCSVInResourcesWithName(file_name)
    }
    
    
    /* Class Property Getter and Setters */
    
    func isEmpty() -> Bool {
        if count() == 0 {
            return true
        } else {
            return false
        }
    }
    
    func count() -> Int {
        return matrix.count
    }
    
    func rowCount() -> Int {
        return row_totals.count
    }
    
    func columnCount() -> Int {
        return col_totals.count
    }
    
    func isValidIndex(row: Int, column: Int) -> Bool {
        return row >= 0 && row < self.rowCount() && column >= 0 && column < self.columnCount()
    }
    
    
    /* Public Class Functions */
    
    func loadDataFromCSVInResourcesWithName(file_name: String, removeLabels: Bool=true) {
        var resourceFail = false
        let path: String? = NSBundle.mainBundle().pathForResource(file_name, ofType: "")
        if path? != nil {
            var error: NSError?
            let resourceFile: String? = String.stringWithContentsOfFile(path!, encoding: NSUTF8StringEncoding, error:&error)
            if resourceFile? != nil {
                parseFileData(resourceFile!, removeLabels: removeLabels)
            } else {
                println("Error: \(error?.localizedDescription)")
                resourceFail = true
            }
        } else {
            resourceFail = true
        }
        
        if resourceFail {
            let dirs : [String]? = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]
            if (dirs? != nil) {
                var error: NSError?
                let directories: [String] = dirs!;
                let dir = directories[0];
                let path = dir.stringByAppendingPathComponent(file_name);
                
                let docFile: String? = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error:&error)
                if (docFile? != nil) {
                    parseFileData(docFile!, removeLabels: removeLabels)
                } else {
                    println("Error: \(error?.localizedDescription)")
                }
            }
        }
    }
    
    
    /* Private Class Functions */
    
    func parseFileData(file: String, removeLabels: Bool) {
        if file == "" {
            println("Empty File Detected")
            return
        }
        
        var rowOffset = 0
        var colOffset = 0
        let arrayOfRows = file.componentsSeparatedByString("\n")
        for (rowIndex, row) in enumerate(arrayOfRows) {
            let rowArray = row.componentsSeparatedByString(",")
            for (colIndex, num) in enumerate(rowArray) {
                let finalNum: Double? = num.doubleValue()
                if finalNum? != nil {
                    self[(rowIndex - rowOffset < 0) ? 0 : (rowIndex - rowOffset), colIndex - colOffset] = finalNum!
                } else if removeLabels {
                    if rowIndex == 0 {
                        rowOffset = 1
                        break
                    } else {
                        colOffset = 1
                    }
                } else {
                    if rowIndex == 0 {
                        col_labels.append(num)
//                        col_labels += num
                        rowOffset = 1
                    } else {
                        row_labels.append(num)
//                        row_labels += num
                        colOffset = 1
                    }
                }
            }
        }
    }
    
    
    /* Subscripts */
    
    func createValidIndex(row: Int, column: Int) {
        let place: Double = 0.0
        let act_row = (row > rowCount()) ? row : rowCount()
        let act_col = (column > columnCount()) ? column : columnCount()
        let staticMatrixCount: Int = ((act_row * act_col) - matrix.count)
        for _ in 1...(staticMatrixCount) {
            matrix.append(place)
//            matrix += place
        }
        
        let staticRowCount: Int = (row - row_totals.count)
        if staticRowCount > 0 {
            for _ in 1...(staticRowCount) {
                row_totals.append(place)
//                row_totals += place
            }
        }
        
        let staticColCount: Int = (column - col_totals.count)
        if staticColCount > 0 {
            for _ in 1...(staticColCount) {
                col_totals.append(place)
//                col_totals += place
            }
        }
    }
    
    subscript(row: Int, col: Int) -> Double {
        get {
            assert(isValidIndex(row, column: col), "Index out of range")
            return matrix[(row * columnCount()) + col]
        }
        set {
            if !isValidIndex(row, column: col) {
                createValidIndex(row + 1, column: col + 1)
            }
            
            let oldValue = matrix[(row * columnCount()) + col]
            matrix[(row * columnCount()) + col] = newValue
            row_totals[row] += newValue - oldValue
            col_totals[col] += newValue - oldValue
            
            let signifDigits = "\(newValue)".utf16Count
            if signifDigits > largestSignificantDigits {
                largestSignificantDigits = signifDigits
            }
        }
    }
    
    
    /* Debug Printouts */
    
    func printMatrix() {
        if matrix.count <= 0 {
            println("Error Empty Matrix")
            return
        }
        
        let row_passes = (2 * row_totals.count) + 3
        let col_passes = (2 * col_totals.count) + 3
        for row_index in 0..<row_passes {
            var line = ""
            for col_index in 0..<col_passes {
                let curRowIndex = convertIndex(row_index, length: row_passes)
                let curColIndex = convertIndex(col_index, length: col_passes)
                
                if row_index == 0 || row_index == row_passes - 1 || row_index % 2 == 1 {
                    if col_index % 2 == 0 && col_index > 0 && col_index < col_passes - 1 {
                        if row_index == 0 {
                            let num = Int(floor(Double(largestSignificantDigits) / 2.0))
                            for _ in 1...num { line += " " }
                            line += "\(curColIndex)"
                            for _ in 1...((largestSignificantDigits % 2 == 0) ? num - 1 : num) { line += " " }
                        } else if row_index == row_passes - 1 {
                            line += padStringWithSignificantDigitsForNumber(col_totals[curColIndex])
                        } else if row_index % 2 == 1 {
                            for _ in 1...largestSignificantDigits { line += "-" }
                        }
                    } else {
                        line += " "
                    }
                } else if row_index % 2 == 0 {
                    if col_index == 0 {
                        line += "\(curRowIndex)"
                    } else if col_index == col_passes - 1 {
                        line += padStringWithSignificantDigitsForNumber(row_totals[curRowIndex])
                    } else if col_index % 2 == 0 {
                        line += padStringWithSignificantDigitsForNumber(self[curRowIndex, curColIndex])
                    } else if col_index % 2 == 1 {
                        line += "|"
                    }
                }
            }
            println(line)
        }
    }
    
    func padStringWithSignificantDigitsForNumber(number: Double) -> String {
        var ret = ""
        
        let numCount: Int = "\(number)".utf16Count
        let numSignifDigits: Int = largestSignificantDigits - "\(number)".utf16Count
        if numSignifDigits >= 1 {
            for _ in 1...numSignifDigits { ret += " " }
        }
        return ret + "\(number)"
    }
    
    func convertIndex(index: Int, length: Int) -> Int {
        if index == 0 { return 0 }
        var tIndex = index
        if tIndex % 2 == 1 { tIndex++ }
        if tIndex == length - 1 {
            return ((tIndex - 2) / 2) - 1
        } else {
            return (tIndex / 2) - 1
        }
    }
}