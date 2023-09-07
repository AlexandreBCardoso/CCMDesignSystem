//
//  ThemeRepositoryTestCase.swift
//  CCMDesignSystem
//
//  Created by Alexandre Cardoso on 06/09/23.
//

@testable import CCMDesignSystem
import CCMNetwork
import XCTest

final class ThemeRepositoryTestCase: XCTestCase {

    func test_fetchThemeList_withSuccess_oneTheme() throws {
        let expectation = expectation(description: "ThemeRepository.fetchThemeList")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        let dataFake = try XCTUnwrap(makeData(with: "listOneTheme"))
        networkStub.completionHandler = .success(dataFake)

        sut.fetchThemeList { result in
            switch result {
                case let .success(response):
                    XCTAssertEqual(response.count, 1)
                    XCTAssertEqual(response[0].name, "Light")
                    XCTAssertEqual(response[0].id, 1)
                    XCTAssertFalse(response[0].isInativo)
                    XCTAssertEqual(response[0].uid, "2023-09-06a43fe065-20c6-47bd-ac06-acb31380bdff")
                    XCTAssertEqual(response[0].uidFirebase, "UidFirebase")
                case .failure:
                    XCTFail("Error should fall into success")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_fetchThemeList_withSuccess_twoTheme() throws {
        let expectation = expectation(description: "ThemeRepository.fetchThemeList")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        let dataFake = try XCTUnwrap(makeData(with: "listTwoTheme"))
        networkStub.completionHandler = .success(dataFake)

        sut.fetchThemeList { result in
            switch result {
                case let .success(response):
                    XCTAssertEqual(response.count, 2)
                    XCTAssertEqual(response[0].name, "Light")
                    XCTAssertEqual(response[0].id, 1)
                    XCTAssertFalse(response[0].isInativo)
                    XCTAssertEqual(response[0].uid, "2023-09-06a43fe065-20c6-47bd-ac06-acb31380bdff")
                    XCTAssertEqual(response[0].uidFirebase, "UidFirebase")
                    XCTAssertEqual(response[1].name, "Dark")
                    XCTAssertEqual(response[1].id, 2)
                    XCTAssertFalse(response[1].isInativo)
                    XCTAssertEqual(response[1].uid, "2023-09-065e2d7b61-a10c-4d0e-bfb4-f1ea93a1c853")
                    XCTAssertEqual(response[1].uidFirebase, "UidFirebase")
                case .failure:
                    XCTFail("Error should fall into success")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_fetchThemeList_withError_NetworkError() throws {
        let expectation = expectation(description: "ThemeRepository.fetchThemeList")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        networkStub.completionHandler = .failure(.networkError)

        sut.fetchThemeList { result in
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
    
    func test_fetchThemeList_withError_parse() throws {
        let expectation = expectation(description: "ThemeRepository.fetchThemeList")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        let dataFake = try XCTUnwrap(makeData(with: "themeById"))
        networkStub.completionHandler = .success(dataFake)

        sut.fetchThemeList { result in
            switch result {
                case .success:
                    XCTFail("Error should fall into failure")
                case let .failure(error):
                    XCTAssertEqual(error.localizedDescription, "Os dados não puderam ser lidos porque não estão no formato correto.")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_fetchTheme_withSuccess_ThemeById() throws {
        let expectation = expectation(description: "ThemeRepository.fetchTheme")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        let dataFake = try XCTUnwrap(makeData(with: "themeById"))
        networkStub.completionHandler = .success(dataFake)

        sut.fetchTheme(with: 1) { result in
            switch result {
                case let .success(response):
                    XCTAssertEqual(response.name, "Light")
                    XCTAssertEqual(response.id, 1)
                    XCTAssertFalse(response.isInativo)
                    XCTAssertEqual(response.uid, "2023-09-06a43fe065-20c6-47bd-ac06-acb31380bdff")
                    XCTAssertEqual(response.uidFirebase, "UidFirebase")
                case .failure:
                    XCTFail("Error should fall into success")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_fetchTheme_withError_NetworkError() throws {
        let expectation = expectation(description: "ThemeRepository.fetchTheme")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        networkStub.completionHandler = .failure(.networkError)
        
        sut.fetchTheme(with: 1) { result in
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
    
    func test_fetchTheme_withError_parse() throws {
        let expectation = expectation(description: "ThemeRepository.fetchThemeList")
        let (sut, networkStub) = makeSUT(uidFirebase: "uidFirebase")
        let dataFake = try XCTUnwrap(makeData(with: "listOneTheme"))
        networkStub.completionHandler = .success(dataFake)

        sut.fetchTheme(with: 1) { result in
            switch result {
                case .success:
                    XCTFail("Error should fall into failure")
                case let .failure(error):
                    XCTAssertEqual(error.localizedDescription, "Os dados não puderam ser lidos porque não estão no formato correto.")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}

extension ThemeRepositoryTestCase {
    
    func makeSUT(uidFirebase: String) -> (sut: ThemeRepository, network: NetworkClientStub) {
        let networkClientStub = NetworkClientStub()
        let sut = ThemeRepository(uidFirebase: uidFirebase, network: networkClientStub)
        
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
