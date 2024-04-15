//
//  ExampleCardView.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 14.09.23.
//

import SwiftUI
import SnapTheme

struct ExampleCardView: View {
	
	@Environment(\.theme) private var theme
	
	var body: some View {
		
		HStack {
			ThemeVStack(alignment: .leading, spacing: .spacingGroups) {
				Label(
					title: {
						Text("Value").theme(text: .cardValue)
					},
					icon: { theme.icon(.favorite).image.theme(font: .cardIcon) }
				)
				ThemeVStack(alignment: .leading, spacing: .spacingElements) {
					Text("Title").theme(text: .cardTitle)
					Text("Subtitle").theme(text: .cardSubtitle)
					Text("Label").theme(text: .cardLabel)
					Text("Text Block").theme(text: .cardBlock)
					Text("Footnote").theme(text: .cardFootnote)
				}
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			Label(
				title: { },
				icon: { theme.icon(.cardIndicatorEnabled).image.theme(font: .cardIndicator) }
			).labelStyle(.iconOnly)
		}
		.frame(maxWidth: .infinity)
		.themeCard(.content)
		
	}
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.scene) {
		ExampleCardView()
	}
	
}
