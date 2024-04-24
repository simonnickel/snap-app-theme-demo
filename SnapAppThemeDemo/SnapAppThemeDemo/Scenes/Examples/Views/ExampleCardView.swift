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
		
		ThemeHStack(spacing: .spacingGroups) {
			Label(
				title: { },
				icon: { theme.icon(.cardIndicatorEnabled).image.theme(font: .cardIndicator) }
			).labelStyle(.iconOnly)

			ThemeVStack(alignment: .leading, spacing: .spacingGroups) {
				ThemeVStack(alignment: .leading) {
					Text("Card Title").theme(text: .cardTitle)
					Text("Card Subtitle").theme(text: .cardSubtitle)
				}
				Label(
					title: {
						Text("Card Value").theme(text: .cardValue)
					},
					icon: { theme.icon(.favorite).image.theme(font: .cardIcon) }
				)
				ThemeVStack(alignment: .leading, spacing: .spacingElements) {
					Text("Card Label").theme(text: .cardLabel)
					Text("Font for longer text blocks. Usually consisting of multiple sentences and spanning more than a single line. Sometimes even more to have an actual block. Using key: .cardBlock").theme(text: .cardBlock)
					Text("Card Footnote").theme(text: .cardFootnote)
				}
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
		.frame(maxWidth: .infinity)
		.themeCard(.content)
		
	}
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.screen) {
		ExampleCardView()
	}
	
}
