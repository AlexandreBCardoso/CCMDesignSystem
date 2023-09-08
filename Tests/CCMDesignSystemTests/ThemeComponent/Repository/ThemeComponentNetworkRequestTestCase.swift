//
//  ThemeComponentNetworkRequestTestCase.swift
//  CCMDesignSystemTests
//
//  Created by Alexandre Cardoso on 07/09/23.
//

@testable import CCMDesignSystem
import XCTest

final class ThemeComponentNetworkRequestTestCase: XCTestCase {

    func test_caseGetListThemeComponent() throws {
        let themeIdExpected = 1
        let uidFirebaseExpected = "any-uidFirebase"
        let sut = ThemeComponentNetworkRequest.getListThemeComponent(
            themeId: themeIdExpected, uIdFirebase: uidFirebaseExpected
        )
        
        XCTAssertEqual(sut.path, "/Api/ThemeComponent/GetListaThemeComponent")
        XCTAssertNil(sut.headers)
        let queryItems = try XCTUnwrap(sut.queryItems)
        XCTAssertEqual(queryItems.count, 2)
        XCTAssertEqual(queryItems, ["uIdFirebase": uidFirebaseExpected, "themeId": "\(themeIdExpected)"])
        XCTAssertEqual(sut.method, .GET)
        XCTAssertNil(sut.body)
    }

    func test_caseGetThemeComponentById() throws {
        let idExpected = 0
        let uidFirebaseExpected = "any-uidFirebase"
        let sut = ThemeComponentNetworkRequest.getThemeComponentById(id: idExpected, uIdFirebase: uidFirebaseExpected)
        
        XCTAssertEqual(sut.path, "/Api/ThemeComponent/GetThemeComponentById")
        XCTAssertNil(sut.headers)
        let queryItems = try XCTUnwrap(sut.queryItems)
        XCTAssertEqual(queryItems.count, 2)
        XCTAssertEqual(queryItems, ["id": "\(idExpected)", "uIdFirebase": uidFirebaseExpected])
        XCTAssertEqual(sut.method, .GET)
        XCTAssertNil(sut.body)
    }
}
