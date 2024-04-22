//
//  ThemeConfigScene.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 26.06.23.
//

import SwiftUI
import SnapCore
import SnapTheme

struct ThemeConfigScene: View {
	
	var body: some View {
		// It's not a List to prevent sticky headers.
		ThemeScene {
			LazyVStack {
				
				ConfigSection(title: "Colors", configSectionID: "color") {
					ThemeConfigSelectionView(options: [.colorsBase, .colorsIndicator])
					ThemeConfigSelectionView(options: [.backgroundsBase, .backgroundsInteractiveGradient, .backgroundsAccentGradient])
				}
				ConfigSection(title: "Fonts", configSectionID: "font") {
					ThemeConfigSelectionView(options: [.fontsBase, .fontsIndicator])
					ThemeConfigSelectionView(options: [.fontFamilyBase, .fontFamilyAlternative])
					ThemeConfigSelectionView(options: [.fontDesignBase, .fontDesignRound, .fontDesignMono, .fontDesignSerif])
				}
				ConfigSection(title: "TextSurfaces", configSectionID: "textSurface") {
					ThemeConfigSelectionView(options: [.textSurfacesBase, .textSurfacesAlternative])
				}
				ConfigSection(title: "Numbers", configSectionID: "number") {
					ThemeConfigSelectionView(options: [.numbersBase, .numbersAlternative])
					ThemeConfigSelectionView(options: [.numbersScale08, .numbersScale09, .numbersScaleBase, .numbersScale11, .numbersScale12])
				}
				ConfigSection(title: "Icons", configSectionID: "icon") {
					ThemeConfigSelectionView(options: [.iconsBase, .iconsAlternative])
				}
				
			}
		}
		
	}
	
	
	// MARK: - ThemeConfigurationSection
	
	struct ConfigSection<Content: View>: View {
		
		@Environment(\.appState) private var appState
		
		let title: String
		let configSectionID: String
		@ViewBuilder let content: () -> Content

		@State private var isExpanded: Bool = true
		
		var body: some View {
			
			Section {
				if isExpanded {
					content()
				} else {
					let enabledConfigs: [String] = appState.themeConfigs.filter({ $0.sectionID == configSectionID }).compactMap({ $0.value })
					Text(enabledConfigs.joined(separator: ", "))
						.frame(maxWidth: .infinity, alignment: .leading)
						.scenePadding(.horizontal)
						.theme(font: .listTitle)
				}
			} header: {
				ThemeSectionHeaderContainer {
					DisclosureGroup(isExpanded: $isExpanded) {
						EmptyNoSpaceView()
					} label: {
						ThemeLabel(
							text: title,
							style: .themeSidebarSectionHeader(textCase: .uppercase)
						)
					}
				}
				.scenePadding(.horizontal)
			}
			
		}
		
	}
}


// MARK: - Previews

#Preview {
	
	ThemeConfigScene()
		.environment(\.theme, Theme.base)
				
}
