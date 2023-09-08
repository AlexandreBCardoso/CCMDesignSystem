//
//  NetworkClientStub.swift
//  CCMDesignSystemTests
//
//  Created by Alexandre Cardoso on 07/09/23.
//

import CCMNetwork
import Foundation

final class NetworkClientStub: NetworkClient {
    
    var completionHandler: ((Result<Data, CCMNetwork.NetworkError>))?
    
    func execute(
        _ request: CCMNetwork.NetworkRequest,
        completion: @escaping (Result<Data, CCMNetwork.NetworkError>) -> Void
    ) {
        if let completionHandler {
            completion(completionHandler)
        } else {
            completion(.failure(.networkError))
        }
    }
    
}
