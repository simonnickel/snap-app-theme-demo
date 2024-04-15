//
//  ThemeConfig+Values.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 27.06.23.
//

extension ThemeConfig {
	
	static let valuesBase = ThemeConfig(sectionID: "value", title: nil, text: "", value: "Base", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			values: [:]
		)
	})
	
	static let valuesAlternative = ThemeConfig(sectionID: "value", title: nil, text: "Other values", value: "Alternative", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			values: [
				.buttonCornerRadius : 0.1
			]
		)
	})
	
	
	static let valuesScaleBase = ThemeConfig(sectionID: "value", title: nil, text: "Scale", value: "1.0", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			scale: 1.0
		)
	})
	
	static let valuesScale08 = ThemeConfig(sectionID: "value", title: nil, text: "Scale", value: "0.8", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			scale: 0.8
		)
	})
	
	static let valuesScale09 = ThemeConfig(sectionID: "value", title: nil, text: "Scale", value: "0.9", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			scale: 0.9
		)
	})
	
	static let valuesScale11 = ThemeConfig(sectionID: "value", title: nil, text: "Scale", value: "1.1", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			scale: 1.1
		)
	})
	
	static let valuesScale12 = ThemeConfig(sectionID: "value", title: nil, text: "Scale", value: "1.2", icon: nil, apply: { theme in
		return theme.replacingDefinitions(
			scale: 1.2
		)
	})
	
}
