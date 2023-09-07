//
//  ThemeComponentNetworkRequest.swift
//  CCMDesignSystem
//
//  Created by Alexandre Cardoso on 07/09/23.
//

import CCMNetwork
import Foundation

enum ThemeComponentNetworkRequest: NetworkRequest {
    
    case getListThemeComponent(themeId: Int, uIdFirebase: String)
    case getThemeComponentById(id: Int, uIdFirebase: String)

    var path: String {
        switch self {
            case .getListThemeComponent:
                return "/Api/ThemeComponent/GetListaThemeComponent"
            case .getThemeComponentById:
                return "/Api/ThemeComponent/GetThemeComponentById"
        }
    }
    
    var headers: [String: String]? { nil }
    
    var queryItems: [String: String]? {
        switch self {
            case let .getListThemeComponent(themeId, uIdFirebase):
                return [
                    "themeId": "\(themeId)",
                    "uIdFirebase": uIdFirebase
                ]
            case let .getThemeComponentById(id, uIdFirebase):
                return [
                    "id": "\(id)",
                    "uIdFirebase": uIdFirebase
                ]
        }
    }
    
    var method: CCMNetwork.HTTPMethod {
        switch self {
            case .getListThemeComponent:
                return .GET
            case .getThemeComponentById:
                return .GET
        }
    }
    
    var body: Data? { nil }
    
}
