//
//  EventsAppTests.swift
//  EventsAppTests
//
//  Created by Gabriel Conte on 12/11/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import XCTest
@testable import EventsApp

class EventsPopulationTest: XCTestCase {
    
    var mocks = Mocks.shared
    
    class DataSourceMock: EventsDataSourceProtocol {
        
        func fetchEvents(completion: @escaping (Error?) -> ()) {
            
            let mockResponse = EventsLocalData.shared.localData
            
            let data = try! JSONSerialization.data(withJSONObject: mockResponse, options: [])
            
            let eventsResponse = try! JSONDecoder().decode(ResponseContainer<[Event]>.self, from: data)
            
            events = eventsResponse.results
            
            completion(nil)
        }
        
        var events: [Event] = []
        
    }
    
    var viewModel: EventsTableViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let ds = DataSourceMock()
        viewModel = EventsTableViewModel(dataSource: ds)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    
    func testHeroForIndex() {
        let expectation = self.expectation(description: "eventForIndex")
        
        
        
        waitForExpectations(timeout: 5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
        
//        XCTAssertEqual(viewModel.hero(for: 0)?.name, "3-D Man")
//        XCTAssertEqual(viewModel.hero(for: 0)?.id, 1011334)
//        XCTAssertNotNil(viewModel.hero(for: 0)?.description, "")
//        XCTAssertNotNil(viewModel.hero(for: 0)?.thumbnail)
//
//        XCTAssertEqual(viewModel.hero(for: 1)?.name, "A-Bomb (HAS)")
//        XCTAssertEqual(viewModel.hero(for: 1)?.id, 1017100)
//        XCTAssertNotNil(viewModel.hero(for: 1)?.description, "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! " + "," + "modified" + ":" + "2013-09-18T15:54:04-0400")
//        XCTAssertNotNil(viewModel.hero(for: 1)?.thumbnail)
    }
    
    func testNumberOfHeroes(){

        let numberOfEvents = viewModel.numberOfEvents()
        
        XCTAssertEqual(numberOfEvents, 5)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

