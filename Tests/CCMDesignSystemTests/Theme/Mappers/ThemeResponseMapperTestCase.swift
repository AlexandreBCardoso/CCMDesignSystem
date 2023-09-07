//
//  ThemeResponseMapperTestCase.swift
//  CCMDesignSystemTests
//
//  Created by Alexandre Cardoso on 05/09/23.
//

@testable import CCMDesignSystem
import XCTest

final class ThemeResponseMapperTestCase: XCTestCase {
    
    func test_map_withThemeResponse() {
        let response = makeThemeResponse()
        let sut = ThemeResponseMapper.map(from: response)
        
        XCTAssertEqual(sut.name, "any-name")
        XCTAssertEqual(sut.id, 0)
        XCTAssertTrue(sut.isInativo)
        XCTAssertEqual(sut.uid, "any-uid")
        XCTAssertEqual(sut.uidFirebase, "any-uidFirebase")
    }
    
    func test_map_withThemeByIdResponse() {
        let response = makeThemeByIdResponse(theme: makeThemeResponse())
        let sut = ThemeResponseMapper.map(from: response)
        
        XCTAssertEqual(sut.name, "any-name")
        XCTAssertEqual(sut.id, 0)
        XCTAssertTrue(sut.isInativo)
        XCTAssertEqual(sut.uid, "any-uid")
        XCTAssertEqual(sut.uidFirebase, "any-uidFirebase")
    }
}

extension ThemeResponseMapperTestCase {
    func makeThemeResponse(
        name: String = "any-name",
        id: Int = 0,
        isInativo: Bool = true,
        creationDate: String = "any-creationDate",
        changeDate: String? = "any-changeDate",
        uid: String = "any-uid",
        uidFirebase: String = "any-uidFirebase",
        isChanged: Bool = true
    ) -> ThemeResponse {
        .init(
            name: name,
            id: id,
            isInativo: isInativo,
            creationDate: creationDate,
            changeDate: changeDate,
            uid: uid,
            uidFirebase: uidFirebase,
            isChanged: isChanged
        )
    }
    
    func makeThemeByIdResponse(
        theme: ThemeResponse,
        resultJson: String? = "any-resultJson",
        isSucess: Bool = true,
        message: String? = "any-message",
        exception: String? = "any-exception",
        stackTrace: String? = "any-stackTrace"
    ) -> ThemeByIdResponse {
        .init(
            theme: theme,
            resultJson: resultJson,
            isSucess: isSucess,
            message: message,
            exception: exception,
            stackTrace: stackTrace
        )
    }
}
