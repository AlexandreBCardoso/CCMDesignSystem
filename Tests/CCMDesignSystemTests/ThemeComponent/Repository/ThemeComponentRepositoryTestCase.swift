//
//  ThemeComponentRepositoryTestCase.swift
//  CCMDesignSystemTests
//
//  Created by Alexandre Cardoso on 07/09/23.
//

@testable import CCMDesignSystem
import CCMNetwork
import XCTest

final class ThemeComponentRepositoryTestCase: XCTestCase {

    func test_fetchThemeComponentList_withSuccess_oneThemeComponent() throws {
        let expectation = expectation(description: "ThemeComponentRepository.fetchThemeComponentList")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        let dataFake = try XCTUnwrap(makeData(with: "listOneThemeComponent"))
        networkStub.completionHandler = .success(dataFake)

        sut.fetchThemeComponentList(themeId: 1) { result in
            switch result {
                case let .success(response):
                    XCTAssertEqual(response.count, 1)
                    XCTAssertEqual(response[0].themeId, 1)
                    XCTAssertEqual(response[0].name, "customButtonPrimary")
                    XCTAssertEqual(response[0].foregroundColor, "white")
                    XCTAssertEqual(response[0].backgroundColor, "#3C58C1")
                    XCTAssertEqual(response[0].fontName, "Roboto")
                    XCTAssertEqual(response[0].fontSize, 24)
                    XCTAssertEqual(response[0].style, 3)
                    XCTAssertEqual(response[0].id, 1)
                    XCTAssertFalse(response[0].isInativo)
                    XCTAssertEqual(response[0].uid, "2023-09-0642b567a2-d0a0-4c86-bfb4-00fa5db2914b")
                    XCTAssertEqual(response[0].uidFirebase, "CodandoComMoa")
                    
                case .failure:
                    XCTFail("Error should fall into success")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_fetchThemeComponentList_withSuccess_twoThemeComponent() throws {
        let expectation = expectation(description: "ThemeComponentRepository.fetchThemeComponentList")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        let dataFake = try XCTUnwrap(makeData(with: "listTwoThemeComponent"))
        networkStub.completionHandler = .success(dataFake)

        sut.fetchThemeComponentList(themeId: 1) { result in
            switch result {
                case let .success(response):
                    XCTAssertEqual(response.count, 2)
                    XCTAssertEqual(response[0].themeId, 1)
                    XCTAssertEqual(response[0].name, "customButtonPrimary")
                    XCTAssertEqual(response[0].foregroundColor, "white")
                    XCTAssertEqual(response[0].backgroundColor, "#3C58C1")
                    XCTAssertEqual(response[0].fontName, "Roboto")
                    XCTAssertEqual(response[0].fontSize, 24)
                    XCTAssertEqual(response[0].style, 3)
                    XCTAssertEqual(response[0].id, 1)
                    XCTAssertFalse(response[0].isInativo)
                    XCTAssertEqual(response[0].uid, "2023-09-0642b567a2-d0a0-4c86-bfb4-00fa5db2914b")
                    XCTAssertEqual(response[0].uidFirebase, "CodandoComMoa")
                    XCTAssertEqual(response[1].themeId, 1)
                    XCTAssertEqual(response[1].name, "customButtonSecundary")
                    XCTAssertEqual(response[1].foregroundColor, "black")
                    XCTAssertEqual(response[1].backgroundColor, "#DADCE2")
                    XCTAssertEqual(response[1].fontName, "Roboto")
                    XCTAssertEqual(response[1].fontSize, 20)
                    XCTAssertEqual(response[1].style, 1)
                    XCTAssertEqual(response[1].id, 2)
                    XCTAssertFalse(response[1].isInativo)
                    XCTAssertEqual(response[1].uid, "2023-09-061f9c30cb-7906-4f3f-836c-7884890ffbc4")
                    XCTAssertEqual(response[1].uidFirebase, "CodandoComMoa")
                    
                case .failure:
                    XCTFail("Error should fall into success")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_fetchThemeComponentList_withError_NetworkError() throws {
        let expectation = expectation(description: "ThemeComponentRepository.fetchThemeComponentList")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        networkStub.completionHandler = .failure(.networkError)

        sut.fetchThemeComponentList(themeId: 1) { result in
            switch result {
                case .success:
                    XCTFail("Error should fall into failure")
                case let .failure(error):
                    XCTAssertEqual(error as? NetworkError, .networkError)
                    XCTAssertEqual(error.localizedDescription, "An error has occurred. Please verify your connection.")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_fetchThemeComponentList_withError_parse() throws {
        let expectation = expectation(description: "ThemeComponentRepository.fetchThemeComponentList")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        let dataFake = try XCTUnwrap(makeData(with: "themeById"))
        networkStub.completionHandler = .success(dataFake)

        sut.fetchThemeComponentList(themeId: 1) { result in
            switch result {
                case .success:
                    XCTFail("Error should fall into failure")
                case let .failure(error):
                    XCTAssertEqual(
                        error.localizedDescription,
                        "Os dados não puderam ser lidos porque não estão no formato correto."
                    )
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_fetchThemeComponent_withSuccess_themeComponentById() throws {
        let expectation = expectation(description: "ThemeComponentRepository.fetchThemeComponentList")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        let dataFake = try XCTUnwrap(makeData(with: "themeComponentById"))
        networkStub.completionHandler = .success(dataFake)

        sut.fetchThemeComponent(id: 1) { result in
            switch result {
                case let .success(response):
                    XCTAssertEqual(response.themeId, 1)
                    XCTAssertEqual(response.name, "customText")
                    XCTAssertEqual(response.foregroundColor, "#24A5E8")
                    XCTAssertEqual(response.backgroundColor, "transparent")
                    XCTAssertEqual(response.fontName, "Roboto")
                    XCTAssertEqual(response.fontSize, 24)
                    XCTAssertEqual(response.style, 3)
                    XCTAssertEqual(response.id, 3)
                    XCTAssertFalse(response.isInativo)
                    XCTAssertEqual(response.uid, "2023-09-06a66b52e0-430c-4b76-ac45-6aeb01c967b4")
                    XCTAssertEqual(response.uidFirebase, "CodandoComMoa")
                case .failure:
                    XCTFail("Error should fall into success")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_fetchThemeComponent_withError_NetworkError() throws {
        let expectation = expectation(description: "ThemeComponentRepository.fetchThemeComponentList")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        networkStub.completionHandler = .failure(.networkError)
        
        sut.fetchThemeComponent(id: 3) { result in
            switch result {
                case .success:
                    XCTFail("Error should fall into failure")
                case let .failure(error):
                    XCTAssertEqual(error as? NetworkError, .networkError)
                    XCTAssertEqual(error.localizedDescription, "An error has occurred. Please verify your connection.")
            }

            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_fetchThemeComponent_withError_parse() throws {
        let expectation = expectation(description: "ThemeComponentRepository.fetchThemeComponentList")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        let dataFake = try XCTUnwrap(makeData(with: "listOneTheme"))
        networkStub.completionHandler = .success(dataFake)

        sut.fetchThemeComponent(id: 1) { result in
            switch result {
                case .success:
                    XCTFail("Error should fall into failure")
                case let .failure(error):
                    XCTAssertEqual(
                        error.localizedDescription,
                        "Os dados não puderam ser lidos porque não estão no formato correto."
                    )
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

}

extension ThemeComponentRepositoryTestCase {
    
    func makeSUT(uidFirebase: String) -> (sut: ThemeComponentRepository, network: NetworkClientStub) {
        let networkClientStub = NetworkClientStub()
        let sut = ThemeComponentRepository(uidFirebase: uidFirebase, network: networkClientStub)
        
        return (sut, networkClientStub)
    }
    
    func makeData(with file: String) throws -> Data? {
        if let pathResource = Bundle.module.path(forResource: file, ofType: "json") {
            let fileURL = URL(fileURLWithPath: pathResource)
            return try Data(contentsOf: fileURL)
        } else {
            return nil
        }
    }
}
