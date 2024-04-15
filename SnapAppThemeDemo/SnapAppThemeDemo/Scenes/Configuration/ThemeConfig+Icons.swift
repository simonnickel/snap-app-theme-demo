//
//  ThemeConfig+Icons.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 27.06.23.
//

import SnapTheme

extension ThemeConfig {
	
	static let iconsBase = ThemeConfig(sectionID: "icon", title: nil, text: "", value: "Base", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			icons: [:]
		)
	})
	
	static let iconsAlternative = ThemeConfig(sectionID: "icon", title: nil, text: "Other Values", value: "Alternative", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			icons: [
				.settings : .system(name: "square")
			]
		)
	})
	
}
