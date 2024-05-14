//
//  ThemeConfigSelectionView.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 26.06.23.
//

import SwiftUI
import SnapTheme

struct ThemeConfigSelectionView: View {
	
	@Environment(\.appState) private var appState
	@Environment(\.appStateBinding) private var appStateBinding
	@Environment(\.templateStateBinding) private var templateStateBinding
	@Environment(\.theme) private var theme
	@ScaledMetric private var scaleFactor: CGFloat = 1
	
	let options: [ThemeConfig]
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			ThemeHStack(spacing: .spacingGroups) {
				ForEach(options) { option in
					Button {
						
						// Only preserve configs that are not part of this selection set.
						var configs = appState.themeConfigs.filter { config in
							!options.contains(config)
						}
						// Add selected config.
						configs.append(option)
						
						// Update AppState.
						var state = appStateBinding.wrappedValue
						state.themeConfigs = configs
						appStateBinding.wrappedValue = state
						
					} label: {
						
						let isSelected = appState.themeConfigs.contains(where: { $0 == option })
						let model = ThemeCornerView.ViewModel(icon: option.icon, title: option.title, text: option.text, value: option.value, isSelected: isSelected)
						ThemeCornerView(model: model, iconOff: nil)
							.themeCard(.accent)
							.environment(\.theme, option.apply(theme))
						
					}
					.frame(
						minWidth: theme.number(.themeConfigCardMinWidth, scaled: scaleFactor),
						maxWidth: .infinity,
						minHeight: theme.number(.themeConfigCardMinHeight, scaled: scaleFactor)
					)
				}
			}
			.scenePadding(.horizontal)
		}
	}
	
}


// MARK: - Previews

#Preview {
	
	let optionFull = ThemeConfig(
		sectionID: "preview",
		title: "Default",
		text: "Fonts and Color",
		value: "123",
		icon: .favorite,
		apply: { theme in
			return theme
		}
	)
	
	let optionValueOnly = ThemeConfig(
		sectionID: "preview",
		title: nil,
		text: nil,
		value: "123",
		icon: nil,
		apply: { theme in
			return theme
		}
	)
	
	let optionNoIcon = ThemeConfig(
		sectionID: "preview",
		title: "Some Other ",
		text: nil,
		value: "123",
		icon: nil,
		apply: { theme in
			return theme
		}
	)
	
	let optionTextOnly = ThemeConfig(
		sectionID: "preview",
		title: "Some Other ",
		text: "Fonts and Color",
		value: nil,
		icon: nil,
		apply: { theme in
			return theme
		}
	)
	
	let optionLong = ThemeConfig(
		sectionID: "preview",
		title: "Default Title",
		text: "Text with Fonts and Color",
		value: "123 and more",
		icon: .favorite,
		apply: { theme in
			return theme
		}
	)
	
	let optionB = ThemeConfig(
		sectionID: "preview",
		title: "Some Other ",
		text: nil,
		value: "123",
		icon: .favorite,
		apply: { theme in
			return theme
		}
	)
	
	return ThemeConfigSelectionView(options: [optionFull, optionValueOnly, optionNoIcon, optionTextOnly, optionLong, optionB])
		.environment(\.theme, Theme.baseApp)
	
}

