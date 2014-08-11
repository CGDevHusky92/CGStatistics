//
//  CGMathTest.swift
//  CGMathTest
//
//  Created by Charles Gorectke on 8/4/14.
//  Copyright (c) 2014 Revision Works, LLC. All rights reserved.
//

import Cocoa
import XCTest

class CGMathTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMatrixOne() {
        var matrix = CGMatrix(file_name: "CGTestMatrix1")
        matrix.printMatrix()
        XCTAssert(true, "PASS: Matrix One Pass")
    }
    
    func testMatrixTwo() {
        var matrix = CGMatrix(file_name: "CGTestMatrix2")
        matrix.printMatrix()
        XCTAssert(true, "PASS: Matrix Two Pass")
    }
    
    func testMatrixThree() {
        var matrix = CGMatrix(file_name: "CGTestMatrix3")
        matrix.printMatrix()
        XCTAssert(true, "PASS: Matrix Three Pass")
    }
    
    func testMatrixAdd() {
        var matrixAdd1 = CGMatrix(file_name: "CGTestMatrixAdd1")
        var matrixAdd2 = CGMatrix(file_name: "CGTestMatrixAdd2")
        matrixAdd1 += matrixAdd2
        var matrixAddF = CGMatrix(file_name: "CGTestMatrixAddFinal")
        XCTAssert(matrixAdd1 == matrixAddF, "PASS: Add Matrices Are Equivalent")
    }
    
    func testMatrixSub() {
        var matrixSub1 = CGMatrix(file_name: "CGTestMatrixSub1")
        var matrixSub2 = CGMatrix(file_name: "CGTestMatrixSub2")
        matrixSub1 -= matrixSub2
        var matrixSubF = CGMatrix(file_name: "CGTestMatrixSubFinal")
        XCTAssert(matrixSub1 == matrixSubF, "PASS: Sub Matrices Are Equivalent")
    }
    
    func testMatrixMultiply() {
        var matrixMult1 = CGMatrix(file_name: "CGTestMatrixMultT1-1")
        var matrixMult2 = CGMatrix(file_name: "CGTestMatrixMultT1-2")
        matrixMult1 *= matrixMult2
        var matrixMultF = CGMatrix(file_name: "CGTestMatrixMultT1-Final")
        XCTAssert(matrixMult1 == matrixMultF, "PASS: Mult Matrices Are Equivalent")
    }
    
    func testMatrixDivision() {
        var matrixDiv1 = CGMatrix(file_name: "CGTestMatrixDivT1-1")
        var matrixDiv2 = CGMatrix(file_name: "CGTestMatrixDivT1-2")
        matrixDiv1 /= matrixDiv2
        matrixDiv1.printMatrix()
        
        var matrixDivF = CGMatrix(file_name: "CGTestMatrixDivT1-Final")
        XCTAssert(matrixDiv1 == matrixDivF, "PASS: Div Matrices Are Equivalent")
    }
    
    
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
