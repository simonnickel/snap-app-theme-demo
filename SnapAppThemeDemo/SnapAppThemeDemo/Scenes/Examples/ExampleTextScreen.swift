//
//  ExampleTextScreen.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 13.09.23.
//

import SwiftUI
import SnapTheme

struct ExampleTextScreen: View {
	
	var body: some View {
		
		ThemeScene {
			
			ThemeSectionHeaderContainer(top: nil, inset: .cardPadding) {
				ThemeLabel(text: "Label Style Section Header")
					.labelStyle(.themeSectionHeader(textCase: .uppercase, prominent: false))
			}
			
			ThemeVStack(spacing: .spacingGroups) {
				ExampleTextView()
					.themeCard(.content)
				
				ExampleCardView()
			}
			
			ThemeSectionHeaderContainer(inset: .cardPadding) {
				ThemeLabel(text: "Prominent Header")
					.labelStyle(.themeSectionHeader(prominent: true))
			}
			
			ThemeCornerView(model: .init(icon: .favorite, title: "Card Title", text: "Card Text", value: "123", isSelected: true))
				.themeCard(.accent)
			
		}
		.navigationDestination(for: String.self) { value in
			Text(value)
		}
		
	}
	
}


// MARK: - Previews

#Preview {
	
	ExampleTextScreen()
		.environment(\.theme, .baseApp.replacingDefinitions(
			fonts: ThemeConfig.fontsIndicatorDict
		))
	
}
