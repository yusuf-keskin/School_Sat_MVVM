//
//  SchoolDetailsServiceTest.swift
//  NYCSchoolsTests
//
//  Created by YUSUF KESKİN on 19.07.2022.
//

import XCTest
@testable import NYCSchools

class SchoolDetailsServiceTest: XCTestCase {
    
    var sut : SchoolDetailsService!
    var mockUrlSession : MockUrlSession!

    override func setUpWithError() throws {
        sut = SchoolDetailsService()
        mockUrlSession = MockUrlSession()
        sut.session = mockUrlSession

    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testDownload_UsesExpectedHost () {
        let examUrl = DETAILS_URL
        sut.getSchoolExamScore(withUrl: examUrl!) { schoolList in

        }
        let urlComponents = URLComponents(url: examUrl!, resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.host, "data.cityofnewyork.us")
    }
    
    func testDownload_UsesExpectedPath () {
        let examUrl = DETAILS_URL
        sut.getSchoolExamScore(withUrl: URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!) { schoolList in

        }
        let urlComponents = URLComponents(url: examUrl!, resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.path, "/resource/s3k6-pzi2.json")
    }

}

extension SchoolDetailsServiceTest {
    class MockUrlSession : SessionProtocol {
        var url : URL?
        
        func dataTask(with url : URL, completionHandler : @escaping (Data?, URLResponse?, Error?)->()) -> URLSessionDataTask {
            self.url = url
            return URLSession.shared.dataTask(with: url)
        }
    }
}
