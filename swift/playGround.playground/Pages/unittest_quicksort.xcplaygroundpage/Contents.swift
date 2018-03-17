//: [Previous](@previous)

import Foundation
import XCTest


class QuickSortTest:XCTestCase{
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    func test_quickSort_param(){
        let array = [0]
        XCTAssertEqual(array, quicksort(array), "Should be equal")
    }
    
    func test_quicksort_param2(){
        let array = [1]
        XCTAssertEqual(array, quicksort(array), "Should be equal")
    }
    
    func test_quicksort_length_2(){
        let array = [0,1]
        XCTAssertEqual(array, quicksort(array), "Should be [0,1]")
    }
    
    func test_quicksort_length_2_1(){
        let array = [1,0]
        XCTAssertEqual([0,1], quicksort(array), "Should be [0,1]")
    }
    
    func test_quicksort_long_int_array(){
        let array = [1,0,2,4,6,5,3]
        XCTAssertEqual([0,1,2,3,4,5,6], quicksort(array), "Should be sorted")
    }
    
    func test_quicksort_long_double_array(){
        let array = [1.0,0.0,2.0,4.0,6.0,5.0,3.0]
        XCTAssertEqual([0.0,1.0,2.0,3.0,4.0,5.0,6.0], quicksort(array), "Should be sorted")
    }

}

func quicksort<T :Comparable>(_ array:[T]) -> [T]{
    if array.count <= 1 { return array }
    
    let pivot: T = array[array.count/2]
    
    return quicksort(array.filter({ $0 < pivot})) + array.filter({ $0 == pivot }) + quicksort(array.filter({ $0 > pivot}))
}

QuickSortTest.defaultTestSuite.run()
