//
//  ProductViewModel_Tests.swift
//  ProductAPI_Tests
//
//  Created by Manish Parihar on 02.10.23.
//

import XCTest
@testable import ProductAPI


// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct or class]_[variable or function]_[expected result]
// Testing Structure: Given, When, Then

final class ProductViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor func tests_ProductViewModel_getProductList_shouldBeInjectedValue() {
        // Given =
        let productShowingResponse = Product(products: [], total: 0, skip: 0, limit: 0)
        
        // When
        let vm = ProductViewModel()
        
        // Then
        XCTAssertEqual(vm.productResponse, productShowingResponse)
    }
    
    
   @MainActor func tests_ProductViewModel_getProductList_shouldBeInjectedValue_stressed() {
        // This test is more safer than above code fragment bcoz it test 10 times
        for _ in 0..<10 {
            // Given =
            let productShowingResponse = Product(products: [], total: 0, skip: 0, limit: 0)
            
            // When
            let vm = ProductViewModel()
            
            // Then
            XCTAssertEqual(vm.productResponse, productShowingResponse)
        }
    }
    
    @MainActor func test_ProductViewModel_getProductArray_shouldBeEmpty() {
        // Given
        
        
        // When
        let vm = ProductViewModel()
        
        // Then
        XCTAssertTrue(vm.productResponse.products.isEmpty)
        XCTAssertEqual(vm.productResponse.products.count, 0)
    }
    
    @MainActor func test_ProductViewModel_getProductArray_shouldShowProductItems() {
        // Given
        let vm = ProductViewModel()
        
        // When
        vm.getProductList(limit: 30)
        
        // Then
        XCTAssertTrue(!vm.productResponse.products.isEmpty)
        XCTAssertFalse(vm.productResponse.products.isEmpty)
        XCTAssertEqual(vm.productResponse.products.count,1)
        XCTAssertEqual(vm.productResponse.products.count, 0)
        XCTAssertGreaterThan(vm.productResponse.products.count, 0)
    }
    
    /*
    @MainActor func test_ProductViewModel_testGetProductList() {
        // Given
        let vm = ProductViewModel()
        let expectation = expectation(description: "Data fetched and decode succesfully")
        
        // When
        vm.getProductList(limit: 30)
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
           
            if let productResponse = vm.productResponse {
                    XCTAssertNotNil(productResponse, "Response should not be nil")
                    expectation.fulfill()
            } else {
                XCTFail("Failed to fetch data")
            }
        }
        
        waitForExpectations(timeout: 5)
    }
    */
    
    

}
