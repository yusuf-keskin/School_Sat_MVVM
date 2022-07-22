//
//  NYCSchoolsUITests.swift
//  NYCSchoolsUITests
//
//  Created by YUSUF KESKİN on 19.07.2022.
//

import XCTest

class NYCSchoolsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
    }
    
    
    func testWhenTableCellTapped_NextViewControllerLoads() throws {
        let app = XCUIApplication()
        app.launch()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        XCTAssertTrue(app.staticTexts["Critical Reading Score    :"].exists, "Critical Reading Score should exists")
        
    }
    
    
    func testWhenbackBtnTapped_PreviousViewControllerLoads() throws {
        let app = XCUIApplication()
        app.launch()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        app.buttons["Back"].tap()
        
        XCTAssertTrue(app.staticTexts["List of NYC Shcools"].exists, "List View Could'n be loaded back")
        
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
