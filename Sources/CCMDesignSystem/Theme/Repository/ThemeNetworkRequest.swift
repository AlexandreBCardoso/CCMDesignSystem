//
//  ThemeNetworkRequest.swift
//  CCMDesignSystem
//
//  Created by Alexandre Cardoso on 05/09/23.
//

import CCMNetwork
import Foundation

enum ThemeNetworkRequest: NetworkRequest {
    case getListTheme(_ uidFirebase: String)
    case getThemeById(id: Int, uidFirebase: String)
    
    var path: String {
        switch self {
            case .getListTheme:
                return "/Api/Theme/GetListaTheme"
            case .getThemeById:
                return "/Api/Theme/GetThemeById"
        }
    }
    
    var headers: [String: String]? { nil }
    
    var queryItems: [String: String]? {
        switch self {
            case let .getListTheme(uidFirebase):
                return [
                    "uIdFirebase": uidFirebase,
                ]
            case let .getThemeById(id, uidFirebase):
                return [
                    "id": "\(id)",
                    "uIdFirebase": uidFirebase,
                ]
        }
    }
    
    var method: CCMNetwork.HTTPMethod {
        switch self {
            case .getListTheme:
                return .GET
            case .getThemeById:
                return .GET
        }
    }
    
    var body: Data? { nil }
    
}
