//
//  ThemeConfig+Colors.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 27.06.23.
//

import SnapTheme

extension ThemeConfig {
	
	
	// MARK: Colors
	
	static let colorsBase = ThemeConfig(sectionID: "color", title: nil, text: "", value: "Base", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			colors: [:]
		)
	})
	
	static let colorsIndicator = ThemeConfig(sectionID: "color", title: nil, text: nil, value: "Indicator", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			colors: colorsIndicatorDict
		)
	})
	static let colorsIndicatorDict: [Theme.ColorKey : Theme.ColorValue] = [
		.foreground : .color(.green),
		.foregroundSecondary : .color(.teal),
		.foregroundOnBackground : .color(.yellow),
		.foregroundDisabled : .color(.brown),

		.accentColorBase : .color(.purple),
		.destructive : .color(.pink),
		
		.exampleColor : .color(.brown),
	]
	
	
	// MARK: Surfaces
	
	static let gradientsBase = ThemeConfig(sectionID: "color", title: nil, text: "", value: "No Gradients", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			surfaces: [:],
			backgrounds: [:]
		)
	})
	
	static let gradientsInteractive = ThemeConfig(sectionID: "color", title: nil, text: nil, value: "Interactive", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			surfaces: [
				.accentForeground : .color(.accentPrimary),
				.accentBackground : .color(.accentPrimary),
				.accentForegroundNavigation : .key(.accentForeground),
				.accentForegroundInteractive : .key(.accentGradientForeground),
				.accentBackgroundInteractive : .key(.accentGradientBackground),
			]
		)
	})
	
	static let gradientsInteractiveAndNav = ThemeConfig(sectionID: "color", title: nil, text: nil, value: "Inter + Nav", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			surfaces: [
				.accentForeground : .color(.accentPrimary),
				.accentBackground : .color(.accentPrimary),
				.accentForegroundNavigation : .key(.accentGradientForeground),
				.accentForegroundInteractive : .key(.accentGradientForeground),
				.accentBackgroundInteractive : .key(.accentGradientBackground),
			]
		)
	})
	
	static let gradientsAll = ThemeConfig(sectionID: "color", title: nil, text: nil, value: "All Accent", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			surfaces: [
				.accentForeground : .key(.accentGradientBackground),
				.accentBackground : .key(.accentGradientBackground),
				.accentForegroundNavigation : .key(.accentGradientForeground),
				.accentForegroundInteractive : .key(.accentGradientForeground),
				.accentBackgroundInteractive : .key(.accentGradientBackground),
			]
		)
	})
	
}
