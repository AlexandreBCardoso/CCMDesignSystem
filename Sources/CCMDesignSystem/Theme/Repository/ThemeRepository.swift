//
//  ThemeRepository.swift
//  CCMDesignSystem
//
//  Created by Alexandre Cardoso on 05/09/23.
//

import CCMNetwork
import Foundation

public protocol GetThemeDataSource {
    func fetchThemeList(completion: @escaping (Result<[ThemeModel], Error>) -> Void)
    func fetchTheme(with id: Int, completion: @escaping (Result<ThemeModel, Error>) -> Void)
}

public final class ThemeRepository: GetThemeDataSource {
    private let uidFirebase: String
    private let network: NetworkClient
    
    public init(uidFirebase: String, network: NetworkClient) {
        self.uidFirebase = uidFirebase
        self.network = network
    }
    
    public func fetchThemeList(completion: @escaping (Result<[ThemeModel], Error>) -> Void) {
        network.execute(ThemeNetworkRequest.getListTheme(uidFirebase)) { result in
            switch result {
                case let .success(data):
                    let decoder = JSONDecoder()
                    do {
                        let themeResponse = try decoder.decode([ThemeResponse].self, from: data)
                        let themeModel = themeResponse.map(ThemeResponseMapper.map)
                        completion(.success(themeModel))
                    } catch let error {
                        completion(.failure(error))
                    }
                    
                case let .failure(error):
                    completion(.failure(error))
            }
        }
    }
    
    public func fetchTheme(with id: Int, completion: @escaping (Result<ThemeModel, Error>) -> Void) {
        network.execute(ThemeNetworkRequest.getThemeById(id: id, uidFirebase: uidFirebase)) { result in
            switch result {
                case let .success(data):
                    let decoder = JSONDecoder()
                    do {
                        let themeResponse = try decoder.decode(ThemeByIdResponse.self, from: data)
                        let themeModel = ThemeResponseMapper.map(from: themeResponse)
                        completion(.success(themeModel))
                    } catch let error {
                        completion(.failure(error))
                    }
                    
                case let .failure(error):
                    completion(.failure(error))
            }
        }
    }
    
}
