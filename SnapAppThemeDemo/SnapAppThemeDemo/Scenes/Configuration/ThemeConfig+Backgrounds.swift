//
//  ThemeConfig+Backgrounds.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 26.04.24.
//

import SnapTheme

extension ThemeConfig {
	
	
	// MARK: Colors
	
	static let backgroundsBase = ThemeConfig(sectionID: "background", title: nil, text: "", value: "Base", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			backgrounds: [:]
		)
	})
	
	static let backgroundsIndicator = ThemeConfig(sectionID: "background", title: nil, text: nil, value: "Indicator", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			backgrounds: backgroundsIndicatorDict
		)
	})
	static let backgroundsIndicatorDict: [Theme.BackgroundKey : Theme.BackgroundValue] = [
		.screen : .surface(.color(.systemYellow)),
		.content : .surface(.color(.systemOrange), highlight: .overlayHighlightPush),
		.contentSecondary : .surface(.color(.systemYellow)),
		.bar : .surface(.color(.systemPink)),
		.sidebar : .key(.bar),
	]
	
}
