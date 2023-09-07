//
//  ThemeComponentRepository.swift
//  CCMDesignSystem
//
//  Created by Alexandre Cardoso on 07/09/23.
//

import CCMNetwork
import Foundation

public protocol GetThemeComponentDataSource {
    func fetchThemeComponentList(with themeId: Int, completion: @escaping (Result<[ThemeComponentModel], Error>) -> Void)
    func fetchThemeComponent(with id: Int, completion: @escaping (Result<ThemeComponentModel, Error>) -> Void)
}

public final class ThemeComponentRepository: GetThemeComponentDataSource {
    private let uidFirebase: String
    private let network: NetworkClient
    
    public init(uidFirebase: String, network: NetworkClient) {
        self.uidFirebase = uidFirebase
        self.network = network
    }
    
    public func fetchThemeComponentList(
        with themeId: Int,
        completion: @escaping (Result<[ThemeComponentModel], Error>) -> Void
    ) {
        let request = ThemeComponentNetworkRequest.getListThemeComponent(themeId: themeId, uIdFirebase: uidFirebase)
        network.execute(request) { result in
            switch result {
                case let .success(data):
                    let decoder = JSONDecoder()
                    do {
                        let themeComponentResponse = try decoder.decode([ThemeComponentResponse].self, from: data)
                        let themeComponentModel = themeComponentResponse.map(ThemeComponentResponseMapper.map)
                        completion(.success(themeComponentModel))
                    } catch let error {
                        completion(.failure(error))
                    }
                case let .failure(error):
                    completion(.failure(error))
            }
        }
    }
    
    public func fetchThemeComponent(
        with id: Int,
        completion: @escaping (Result<ThemeComponentModel, Error>) -> Void
    ) {
        let request = ThemeComponentNetworkRequest.getThemeComponentById(id: id, uIdFirebase: uidFirebase)
        network.execute(request) { result in
            switch result {
                case let .success(data):
                    let decoder = JSONDecoder()
                    do {
                        let themeComponentResponse = try decoder.decode(ThemeComponentByIdResponse.self, from: data)
                        let themeComponentModel = ThemeComponentResponseMapper.map(from: themeComponentResponse)
                        completion(.success(themeComponentModel))
                    } catch let error {
                        completion(.failure(error))
                    }
                case let .failure(error):
                    completion(.failure(error))
            }
        }
        
    }
}
