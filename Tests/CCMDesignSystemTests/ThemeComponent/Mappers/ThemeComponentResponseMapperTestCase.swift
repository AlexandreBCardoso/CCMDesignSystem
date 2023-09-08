//
//  ThemeComponentResponseMapperTestCase.swift
//  CCMDesignSystemTests
//
//  Created by Alexandre Cardoso on 07/09/23.
//

@testable import CCMDesignSystem
import XCTest

final class ThemeComponentResponseMapperTestCase: XCTestCase {

    func test_map_withThemeComponentResponse() {
        let response = makeThemeComponentResponse()
        let sut = ThemeComponentResponseMapper.map(from: response)
        
        XCTAssertEqual(sut.themeId, 1)
        XCTAssertEqual(sut.name, "any-name")
        XCTAssertEqual(sut.foregroundColor, "any-foregroundColor")
        XCTAssertEqual(sut.backgroundColor, "any-backgroundColor")
        XCTAssertEqual(sut.fontName, "any-fontName")
        XCTAssertEqual(sut.fontSize, 1)
        XCTAssertEqual(sut.style, 1)
        XCTAssertEqual(sut.id, 1)
        XCTAssertFalse(sut.isInativo)
        XCTAssertEqual(sut.uid, "any-uid")
        XCTAssertEqual(sut.uidFirebase, "any-uidFirebase")
    }
    
    func test_map_withThemeComponentByIdResponse() {
        let response = makeThemeComponentByIdResponse()
        let sut = ThemeComponentResponseMapper.map(from: response)
        
        XCTAssertEqual(sut.themeId, 1)
        XCTAssertEqual(sut.name, "any-name")
        XCTAssertEqual(sut.foregroundColor, "any-foregroundColor")
        XCTAssertEqual(sut.backgroundColor, "any-backgroundColor")
        XCTAssertEqual(sut.fontName, "any-fontName")
        XCTAssertEqual(sut.fontSize, 1)
        XCTAssertEqual(sut.style, 1)
        XCTAssertEqual(sut.id, 1)
        XCTAssertFalse(sut.isInativo)
        XCTAssertEqual(sut.uid, "any-uid")
        XCTAssertEqual(sut.uidFirebase, "any-uidFirebase")
    }
}

extension ThemeComponentResponseMapperTestCase {
    func makeThemeComponentResponse() -> ThemeComponentResponse {
        .init(
            themeId: 1,
            theme: .init(
                name: "theme-name",
                id: 1,
                isInativo: true,
                creationDate: "theme-creationDate",
                changeDate: nil,
                uid: "theme-uid",
                uidFirebase: "theme-uidFirebase",
                isChanged: false
            ),
            name: "any-name",
            foregroundColor: "any-foregroundColor",
            backgroundColor: "any-backgroundColor",
            fontName: "any-fontName",
            fontSize: 1,
            style: 1,
            id: 1,
            isInativo: false,
            creationDate: "any-creationDate",
            changeDate: nil,
            uid: "any-uid",
            uidFirebase: "any-uidFirebase",
            isChanged: false
        )
    }
    
    func makeThemeComponentByIdResponse() -> ThemeComponentByIdResponse {
        .init(
            themeComponent: makeThemeComponentResponse(),
            resultJson: nil,
            isSucess: true,
            message: nil,
            exception: nil,
            stackTrace: nil
        )
    }
}
