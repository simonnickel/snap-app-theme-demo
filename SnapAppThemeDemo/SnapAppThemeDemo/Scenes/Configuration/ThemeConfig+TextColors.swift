//
//  ThemeConfig+TextSurfaces.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 27.06.23.
//

extension ThemeConfig {
	
	static let textSurfacesBase = ThemeConfig(sectionID: "textSurface", title: nil, text: "", value: "Base", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			textSurfaces: [:]
		)
	})
	
	static let textSurfacesAlternative = ThemeConfig(sectionID: "textSurface", title: nil, text: "List Header", value: "Alternative", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			textSurfaces: [
				:
			]
		)
	})
	
}
