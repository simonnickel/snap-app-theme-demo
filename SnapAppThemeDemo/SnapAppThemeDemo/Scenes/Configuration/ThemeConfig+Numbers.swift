//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

extension ThemeConfig {
	
	static let numbersBase = ThemeConfig(sectionID: "value", title: nil, text: "", value: "Base", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			numbers: [:]
		)
	})
	
	static let numbersIndicator = ThemeConfig(sectionID: "value", title: nil, text: "Indicator", value: "Indicator", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			numbers: [
				.spacingSections : .value(64),
				.spacingGroups : .value(32),
				.spacingElements : .value(16),
				.spacingLines : .value(8),
				.paddingModal : .value(32),
				.paddingModalCloseButton : .value(20),
				.strokeSelected : .value(4),
				.cornerRadiusSheet : .value(0),
//				.cornerRadiusElement : .value(),
				.spacingTextHeader : .value(24),
//				.spacingTextTitle : .value(),
//				.spacingTextBlock : .value(),
				.cardCornerRadiusGround : .value(40),
				.cardCornerRadiusFirst : .value(16),
				.cardPadding : .value(24),
				.cardPaddingIndicator : .value(16),
				.listSpacingTitle : .value(8),
				.listRowPaddingVertical : .value(22),
				.listRowPaddingHorizontal : .value(32),
				.listSpacingSections : .value(72),
				.sidebarMacOSBackgroundPaddingHorizontal : .value(20),
				.sidebarBackgroundCornerRadius : .value(16),
//				.buttonCornerRadius : .value(),
				.labelButtonPaddingVertical : .value(24),
				.labelButtonPaddingHorizontal : .value(32),
				.labelTagCornerRadius : .value(8),
				.labelTagPaddingVertical : .value(6),
				.labelTagPaddingHorizontal : .value(16),
			]
		)
	})
	
	
	static let numbersScaleBase = ThemeConfig(sectionID: "value", title: nil, text: "Scale", value: "1.0", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			scale: 1.0
		)
	})
	
	static let numbersScale08 = ThemeConfig(sectionID: "value", title: nil, text: "Scale", value: "0.8", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			scale: 0.8
		)
	})
	
	static let numbersScale09 = ThemeConfig(sectionID: "value", title: nil, text: "Scale", value: "0.9", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			scale: 0.9
		)
	})
	
	static let numbersScale11 = ThemeConfig(sectionID: "value", title: nil, text: "Scale", value: "1.1", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			scale: 1.1
		)
	})
	
	static let numbersScale12 = ThemeConfig(sectionID: "value", title: nil, text: "Scale", value: "1.2", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			scale: 1.2
		)
	})
	
}
