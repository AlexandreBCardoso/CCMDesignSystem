//
//  ThemeComponentResponseMapper.swift
//  CCMDesignSystem
//
//  Created by Alexandre Cardoso on 07/09/23.
//

struct ThemeComponentResponseMapper {
    static func map(from response: ThemeComponentResponse) -> ThemeComponentModel {
        .init(
            themeId: response.themeId,
            name: response.name,
            foregroundColor: response.foregroundColor,
            backgroundColor: response.backgroundColor,
            fontName: response.fontName,
            fontSize: response.fontSize,
            style: response.style,
            id: response.id,
            isInativo: response.isInativo,
            uid: response.uid,
            uidFirebase: response.uidFirebase
        )
    }
    
    static func map(from response: ThemeComponentByIdResponse) -> ThemeComponentModel {
        .init(
            themeId: response.themeComponent.themeId,
            name: response.themeComponent.name,
            foregroundColor: response.themeComponent.foregroundColor,
            backgroundColor: response.themeComponent.backgroundColor,
            fontName: response.themeComponent.fontName,
            fontSize: response.themeComponent.fontSize,
            style: response.themeComponent.style,
            id: response.themeComponent.id,
            isInativo: response.themeComponent.isInativo,
            uid: response.themeComponent.uid,
            uidFirebase: response.themeComponent.uidFirebase
        )
    }
}
