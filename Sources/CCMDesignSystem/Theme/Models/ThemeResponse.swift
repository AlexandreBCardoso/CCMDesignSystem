//
//  ThemeResponse.swift
//  CCMDesignSystem
//
//  Created by Alexandre Cardoso on 05/09/23.
//

struct ThemeResponse: Decodable {
    let name: String
    let id: Int
    let isInativo: Bool
    let creationDate: String
    let changeDate: String?
    let uid: String
    let uidFirebase: String
    let isChanged: Bool
    
    private enum CodingKeys: String, CodingKey {
        case name = "Name"
        case id = "Id"
        case isInativo = "IsInativo"
        case creationDate = "CreationDate"
        case changeDate = "ChangeDate"
        case uid = "Uid"
        case uidFirebase = "UidFirebase"
        case isChanged = "IsChanged"
    }
}
