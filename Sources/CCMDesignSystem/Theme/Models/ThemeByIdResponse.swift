//
//  ThemeByIdResponse.swift
//  CCMDesignSystem
//
//  Created by Alexandre Cardoso on 05/09/23.
//

struct ThemeByIdResponse: Decodable {
    let theme: ThemeResponse
    let resultJson: String?
    let isSucess: Bool
    let message: String?
    let exception: String?
    let stackTrace: String?
    
    private enum CodingKeys: String, CodingKey {
        case theme = "Result"
        case resultJson = "ResultJson"
        case isSucess = "IsSucess"
        case message = "Message"
        case exception = "Exception"
        case stackTrace = "StackTrace"
    }
}

