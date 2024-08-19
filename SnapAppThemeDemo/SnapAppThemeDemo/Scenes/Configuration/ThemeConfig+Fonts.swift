//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
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
	
	static let fontsIndicatorDefinition = Theme.FontValue.definition(Theme.FontDefinition(size: 8, weight: .black))
	static let fontsIndicatorDict: [Theme.FontKey : Theme.FontValue] = [
		.screenHeader : fontsIndicatorDefinition,
		.screenHeaderSubtitle : fontsIndicatorDefinition,
		.screenSectionHeader : fontsIndicatorDefinition,
		
		.textTitle : fontsIndicatorDefinition,
		.textSubtitle : fontsIndicatorDefinition,
		.textBlock : fontsIndicatorDefinition,
		.textLabel : fontsIndicatorDefinition,
		.textIcon : fontsIndicatorDefinition,
		.textValue : fontsIndicatorDefinition,
		.textFootnote : fontsIndicatorDefinition,
		
		.cardTitle : fontsIndicatorDefinition,
		.cardSubtitle : fontsIndicatorDefinition,
		.cardLabel : fontsIndicatorDefinition,
		.cardIcon : fontsIndicatorDefinition,
		.cardValue : fontsIndicatorDefinition,
		.cardBlock : fontsIndicatorDefinition,
		.cardFootnote : fontsIndicatorDefinition,

		.cardIndicator : fontsIndicatorDefinition,
		
		.listTitle : fontsIndicatorDefinition,
		.listSubtitle : fontsIndicatorDefinition,
		.listLabel : fontsIndicatorDefinition,
		.listIcon : fontsIndicatorDefinition,
		.listValue : fontsIndicatorDefinition,
		.listBlock : fontsIndicatorDefinition,
		.listFootnote : fontsIndicatorDefinition,
		
		.listHeader : fontsIndicatorDefinition,
		.listHeaderProminent : fontsIndicatorDefinition,
		.listFooter : fontsIndicatorDefinition,
		.listAccessoryNavigation : fontsIndicatorDefinition,
		
		.sidebarTitle : fontsIndicatorDefinition,
		.sidebarLabel : fontsIndicatorDefinition,
		.sidebarLabelSelected : fontsIndicatorDefinition,
		.sidebarIcon : fontsIndicatorDefinition,
		.sidebarIconSelected : fontsIndicatorDefinition,
		
		.labelButtonPrimary : fontsIndicatorDefinition,
		.labelButtonSecondary : fontsIndicatorDefinition,
		
		.toolbarLabel : fontsIndicatorDefinition,
		.toolbarIcon : fontsIndicatorDefinition,
		.toolbarNavigationLabel : fontsIndicatorDefinition,
		.toolbarNavigationIcon : fontsIndicatorDefinition,
		.toolbarClose : fontsIndicatorDefinition,
		
		.controlTextField : fontsIndicatorDefinition,
		.controlTextFieldProminent : fontsIndicatorDefinition,

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
			fontDesignDefault: .default
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
