//
//  SHDemoAppUITests.swift
//  SHDemoAppUITests
//
//  Created by Farshad Mousalou on 8/15/17.
//  Copyright © 2017 Farshad Mousalou. All rights reserved.
//

import XCTest

class SHDemoAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testTabBarSelection (){
        
        let tabBarsQuery = XCUIApplication().tabBars
        tabBarsQuery.children(matching: .button).element(boundBy: 0).tap()
        tabBarsQuery.children(matching: .button).element(boundBy: 1).tap()
        tabBarsQuery.children(matching: .button).element(boundBy: 2).tap()
        tabBarsQuery.children(matching: .button).element(boundBy: 3).tap()
        tabBarsQuery.children(matching: .button).element(boundBy: 4).tap()
        
    }
    
    func testSelectMainView (){
        
        let app = XCUIApplication()
        app.tabBars.children(matching: .button).element(boundBy: 2).tap()
        
        let goShowsStaticTextLabel = app.navigationBars["GO Shows"].staticTexts["Go Shows"]
        XCTAssertTrue(goShowsStaticTextLabel.exists, "Not found Go Shows")
        
        
    }
    
    func testScrollPageController(){
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        app.buttons["ANIMATIONS"].tap()
        app.buttons["DRAMA"].tap()
        app.buttons["ACTIONS"].tap()
        
        let collectionViewsQuery = app.collectionViews
        let element = collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element
        
        element.swipeLeft()
        element.swipeLeft()
        
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element.swipeRight()
        
        
        
        
    }
    
    func testCollectionViewLoading(){
        let app = XCUIApplication()
        
        let collectionViews = app.collectionViews
        
        
        let firstCell = collectionViews.cells.staticTexts["Kirby Buckets"]
        
        
        let exists = NSPredicate(format: "exists == 1")
        
        XCTAssertTrue(firstCell.exists, "not exist")
        
        expectation(for: exists, evaluatedWith: firstCell,handler : nil)
        
        
        waitForExpectations(timeout: 0.2) { (error) in
            print(error)
        }
        
    }
    
    func testCollectionViewMoreLoading(){
        
    }
    
    
    func testShowDetail(){
        let app = XCUIApplication()
        
        let collectionViews = app.collectionViews
        
        
        let firstCell = collectionViews.cells.staticTexts["Kirby Buckets"]
        
        
        let exists = NSPredicate(format: "exists == 1")
        
        XCTAssertTrue(firstCell.exists, "not exist")
        
        expectation(for: exists, evaluatedWith: firstCell,handler : nil)
        
        firstCell.tap()
        
        waitForExpectations(timeout: 0.2) { (error) in
            print(error)
        }
    }
    
    
    func testShowDetailThenPopToMainView(){
        
        let app = XCUIApplication()
        
        let collectionViews = app.collectionViews
        
        
        let firstCell = collectionViews.cells.staticTexts["Kirby Buckets"]
        
        
        let exists = NSPredicate(format: "exists == 1")
        
        XCTAssertTrue(firstCell.exists, "not exist")
        
        expectation(for: exists, evaluatedWith: firstCell,handler : nil)
        
        firstCell.tap()
        XCUIDevice.shared().orientation = .portrait
        
        app.navigationBars["SHDemoApp.ShowDetailView"].children(matching: .other).element.children(matching: .button).element.tap()
        
        waitForExpectations(timeout: 0.2) { (error) in
            print(error)
        }
        
    }
    
}
