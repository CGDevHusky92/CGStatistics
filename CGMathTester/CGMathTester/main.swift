//
//  main.swift
//  CGMathTester
//
//  Created by Charles Gorectke on 7/1/14.
//  Copyright (c) 2014 Revision Works, LLC. All rights reserved.
//

import Foundation

/* CGMatrix Tests */

let matrixTest = true

let matriceTests = false
let matrixAddTest = true
let matrixSubTest = true
let matrixMultTest = false
let matrixDivTest = false

let statsTest = false
let statsLeafTest = true

if matrixTest {
    println(" ------- Start Testing CGMatrix -------")

    if matriceTests {
        var matrix1 = CGMatrix(file_name: "CGTestMatrix1")
        matrix1.printMatrix()

        var matrix2 = CGMatrix(file_name: "CGTestMatrix2")
        matrix2.printMatrix()

        var matrix3 = CGMatrix(file_name: "CGTestMatrix3")
        matrix3.printMatrix()
    }

    /* Add Test */

    if matrixAddTest {
        var matrixAdd1 = CGMatrix(file_name: "CGTestMatrixAdd1")
        var matrixAdd2 = CGMatrix(file_name: "CGTestMatrixAdd2")
        matrixAdd1 += matrixAdd2
        matrixAdd1.printMatrix()

        var matrixAddF = CGMatrix(file_name: "CGTestMatrixAddFinal")
        if matrixAdd1 == matrixAddF {
            println("PASS: Add Matrices Are Equivalent")
        } else {
            println("FAIL: Add Matrices Are Not Equivalent")
        }
    }

    /* Sub Test */

    if matrixSubTest {
        var matrixSub1 = CGMatrix(file_name: "CGTestMatrixSub1")
        var matrixSub2 = CGMatrix(file_name: "CGTestMatrixSub2")
        matrixSub1 -= matrixSub2
        matrixSub1.printMatrix()
        
        var matrixSubF = CGMatrix(file_name: "CGTestMatrixSubFinal")
        if matrixSub1 == matrixSubF {
            println("PASS: Sub Matrices Are Equivalent")
        } else {
            println("FAIL: Sub Matrices Are Not Equivalent")
        }
    }

    /* Mult Test */

    if matrixMultTest {
        var matrixMult1 = CGMatrix(file_name: "CGTestMatrixMultT1")
        var matrixMult2 = CGMatrix(file_name: "CGTestMatrixMultT2")
        matrixMult1 *= matrixMult2
        matrixMult1.printMatrix()
    }

    /* Div Test */

    if matrixDivTest {
        var matrixDiv1 = CGMatrix(file_name: "CGTestMatrixDiv1")
        var matrixDiv2 = CGMatrix(file_name: "CGTestMatrixDiv2")
        matrixDiv1 /= matrixDiv2
        matrixDiv1.printMatrix()
    }

    println(" ------ Finish Testing CGMatrix -------")
}


/* CGStatistics Tests */

if statsTest {
    println(" ----- Start Testing CGStatistics -----")
    
    if statsLeafTest {
        var stats1 = CGStatistics(file_name: "CGTestStatistics1")
        stats1.printMatrix()
        stats1.debug_printStemLeafPlot()
        
        var stats2 = CGStatistics(file_name: "CGTestStatistics2")
        stats2.printMatrix()
        stats2.debug_printStemLeafPlot()
    }
    
    println(" ---- Finish Testing CGStatistics  ----")
}



