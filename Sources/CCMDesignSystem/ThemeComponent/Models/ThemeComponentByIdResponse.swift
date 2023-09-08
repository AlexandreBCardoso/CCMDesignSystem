//
//  ThemeComponentByIdResponse.swift
//  CCMDesignSystem
//
//  Created by Alexandre Cardoso on 07/09/23.
//

import Foundation

struct ThemeComponentByIdResponse: Decodable {
    let themeComponent: ThemeComponentResponse
    let resultJson: String?
    let isSucess: Bool
    let message: String?
    let exception: String?
    let stackTrace: String?
    
    private enum CodingKeys: String, CodingKey {
        case themeComponent = "Result"
        case resultJson = "ResultJson"
        case isSucess = "IsSucess"
        case message = "Message"
        case exception = "Exception"
        case stackTrace = "StackTrace"
    }
}
