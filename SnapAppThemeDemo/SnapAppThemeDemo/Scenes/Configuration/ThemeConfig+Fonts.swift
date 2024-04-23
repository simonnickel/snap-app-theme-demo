//
//  ThemeConfig+Fonts.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 27.06.23.
//

import SnapTheme

extension ThemeConfig {
	
	
	// MARK: - Fonts
	
	static let fontsBase = ThemeConfig(sectionID: "font", title: nil, text: "", value: "Base", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			fonts: [:]
		)
	})
	
	static let fontsIndicator = ThemeConfig(sectionID: "font", title: nil, text: "", value: "Indicator", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			fonts : fontsIndicatorDict
		)
	})
	
	static let fontsIndicatorDefinition = Theme.FontValue.definition(Theme.FontDefinition(size: 14, design: .monospaced, weight: .black))
	static let fontsIndicatorDict: [Theme.FontKey : Theme.FontValue] = [
		.sceneHeader : fontsIndicatorDefinition,
		.sceneHeaderSubtitle : fontsIndicatorDefinition,
		.sceneSectionHeader : fontsIndicatorDefinition,
		
		.textTitle : fontsIndicatorDefinition,
		.textSubtitle : fontsIndicatorDefinition,
		.textLabel : fontsIndicatorDefinition,
		.textIcon : fontsIndicatorDefinition,
		.textBlock : fontsIndicatorDefinition,
		.textValue : fontsIndicatorDefinition,
		.textFootnote : fontsIndicatorDefinition,
		
		.cardTitle : fontsIndicatorDefinition,
		.cardSubtitle : fontsIndicatorDefinition,
		.cardLabel : fontsIndicatorDefinition,
		.cardIcon : fontsIndicatorDefinition,
		.cardBlock : fontsIndicatorDefinition,
		.cardValue : fontsIndicatorDefinition,
		.cardFootnote : fontsIndicatorDefinition,

		.cardIndicator : fontsIndicatorDefinition,
		
		.listHeader : fontsIndicatorDefinition,
		.listHeaderProminent : fontsIndicatorDefinition,
		.listFooter : fontsIndicatorDefinition,
		
		.listTitle : fontsIndicatorDefinition,
		.listSubtitle : fontsIndicatorDefinition,
		.listLabel : fontsIndicatorDefinition,
		.listIcon : fontsIndicatorDefinition,
		.listBlock : fontsIndicatorDefinition,
		.listValue : fontsIndicatorDefinition,
		.listFootnote : fontsIndicatorDefinition,
		
		.listNavText : fontsIndicatorDefinition,
		
		.sidebarTitle : fontsIndicatorDefinition,
		.sidebarLabel : fontsIndicatorDefinition,
		
		.labelButtonPrimary : fontsIndicatorDefinition,
		.labelButtonSecondary : fontsIndicatorDefinition,

	]
	
	
	// MARK: - FontFamily
	
	static let fontFamilyBase = ThemeConfig(sectionID: "font", title: nil, text: nil, value: "System", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			fontFamilyDefault: .system
		)
	})
	
	static let fontFamilyAlternative = ThemeConfig(sectionID: "font", title: nil, text: nil, value: "AmericanTypewriter", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			fontFamilyDefault: .custom("AmericanTypewriter")
		)
	})
	
	
	// MARK: - Design
	
	static let fontDesignBase = ThemeConfig(sectionID: "font", title: nil, text: nil, value: ".default", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			fontDesignDefault: Theme.base.fontDesignDefault
		)
	})
	
	static let fontDesignRound = ThemeConfig(sectionID: "font", title: nil, text: nil, value: ".rounded", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			fontDesignDefault: .rounded
		)
	})
	
	static let fontDesignMono = ThemeConfig(sectionID: "font", title: nil, text: nil, value: ".monospaced", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			fontDesignDefault: .monospaced
		)
	})
	
	static let fontDesignSerif = ThemeConfig(sectionID: "font", title: nil, text: nil, value: ".serif", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			fontDesignDefault: .serif
		)
	})
	
}
