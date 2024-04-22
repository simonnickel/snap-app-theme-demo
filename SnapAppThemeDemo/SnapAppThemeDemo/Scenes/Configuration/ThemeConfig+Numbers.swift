//
//  ThemeConfig+Numbers.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 27.06.23.
//

extension ThemeConfig {
	
	static let numbersBase = ThemeConfig(sectionID: "value", title: nil, text: "", value: "Base", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			numbers: [:]
		)
	})
	
	static let numbersAlternative = ThemeConfig(sectionID: "value", title: nil, text: "Other numbers", value: "Alternative", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			numbers: [
				.buttonCornerRadius : .value(0.1)
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
