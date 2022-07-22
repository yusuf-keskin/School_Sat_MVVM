//
//  ExamDataServiceTest.swift
//  NYCSchoolsTests
//
//  Created by YUSUF KESKİN on 19.07.2022.
//

import XCTest
@testable import NYCSchools

class ExamDataServiceTest: XCTestCase {
    
    var sut : ExamDataService!
    var mockUrlSession : MockUrlSession!

    override func setUpWithError() throws {
        sut = ExamDataService()
        mockUrlSession = MockUrlSession()
        sut.session = mockUrlSession

    }

    override func tearDownWithError() throws {
    sut = nil
    }

    func testDownload_UsesExpectedHost () {
        let examUrl = EXAM_URL
        sut.getSchoolExamScore(withUrl: examUrl!) { schoolList in

        }
        let urlComponents = URLComponents(url: examUrl!, resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.host, "data.cityofnewyork.us")
    }
    
    func testDownload_UsesExpectedPath () {
        let examUrl = EXAM_URL
        sut.getSchoolExamScore(withUrl: URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")!) { schoolList in

        }
        let urlComponents = URLComponents(url: examUrl!, resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.path, "/resource/f9bf-2cp4.json")
    }
      
}

extension ExamDataServiceTest {
    class MockUrlSession : SessionProtocol {
        var url : URL?
        
        func dataTask(with url : URL, completionHandler : @escaping (Data?, URLResponse?, Error?)->()) -> URLSessionDataTask {
            self.url = url
            return URLSession.shared.dataTask(with: url)
        }
    }
}
