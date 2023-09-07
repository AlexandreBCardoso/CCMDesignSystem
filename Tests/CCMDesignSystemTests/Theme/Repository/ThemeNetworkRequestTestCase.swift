//
//  ThemeNetworkRequestTestCase.swift
//  CCMDesignSystem
//
//  Created by Alexandre Cardoso on 06/09/23.
//

@testable import CCMDesignSystem
import XCTest

final class ThemeNetworkRequestTestCase: XCTestCase {

    func test_caseGetListTheme() throws {
        let uidFirebaseExpected = "any-uidFirebase"
        let sut = ThemeNetworkRequest.getListTheme(uidFirebaseExpected)
        
        XCTAssertEqual(sut.path, "/Api/Theme/GetListaTheme")
        XCTAssertNil(sut.headers)
        let queryItems = try XCTUnwrap(sut.queryItems)
        XCTAssertEqual(queryItems.count, 1)
        XCTAssertEqual(queryItems, ["uIdFirebase": uidFirebaseExpected])
        XCTAssertEqual(sut.method, .GET)
        XCTAssertNil(sut.body)
    }

    func test_caseGetThemeById() throws {
        let idExpected = 0
        let uidFirebaseExpected = "any-uidFirebase"
        let sut = ThemeNetworkRequest.getThemeById(id: idExpected, uidFirebase: uidFirebaseExpected)
        
        XCTAssertEqual(sut.path, "/Api/Theme/GetThemeById")
        XCTAssertNil(sut.headers)
        let queryItems = try XCTUnwrap(sut.queryItems)
        XCTAssertEqual(queryItems.count, 2)
        XCTAssertEqual(queryItems, ["id": "\(idExpected)", "uIdFirebase": uidFirebaseExpected])
        XCTAssertEqual(sut.method, .GET)
        XCTAssertNil(sut.body)
    }
}
