//
//  ThemeComponentResponse.swift
//  CCMDesignSystem
//
//  Created by Alexandre Cardoso on 07/09/23.
//

struct ThemeComponentResponse: Decodable {
    let themeId: Int
    let theme: ThemeResponse
    let name: String
    let foregroundColor: String
    let backgroundColor: String
    let fontName: String
    let fontSize: Int
    let style: Int
    let id: Int
    let isInativo: Bool
    let creationDate: String
    let changeDate: String?
    let uid: String
    let uidFirebase: String
    let isChanged: Bool
    
    private enum CodingKeys: String, CodingKey {
        case themeId = "ThemeId"
        case theme = "Theme"
        case name = "Name"
        case foregroundColor = "ForegroundColor"
        case backgroundColor = "BackgroundColor"
        case fontName = "FontName"
        case fontSize = "FontSize"
        case style = "Style"
        case id = "Id"
        case isInativo = "IsInativo"
        case creationDate = "CreationDate"
        case changeDate = "ChangeDate"
        case uid = "Uid"
        case uidFirebase = "UidFirebase"
        case isChanged = "IsChanged"
    }
}
