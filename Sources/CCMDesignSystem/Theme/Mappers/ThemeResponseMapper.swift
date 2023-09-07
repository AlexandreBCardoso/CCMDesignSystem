//
//  ThemeResponseMapper.swift
//  CCMDesignSystem
//
//  Created by Alexandre Cardoso on 05/09/23.
//

struct ThemeResponseMapper {
    static func map(from response: ThemeResponse) -> ThemeModel {
        .init(
            name: response.name,
            id: response.id,
            isInativo: response.isInativo,
            uid: response.uid,
            uidFirebase: response.uidFirebase
        )
    }
    
    static func map(from response: ThemeByIdResponse) -> ThemeModel {
        .init(
            name: response.theme.name,
            id: response.theme.id,
            isInativo: response.theme.isInativo,
            uid: response.theme.uid,
            uidFirebase: response.theme.uidFirebase
        )
    }
}
