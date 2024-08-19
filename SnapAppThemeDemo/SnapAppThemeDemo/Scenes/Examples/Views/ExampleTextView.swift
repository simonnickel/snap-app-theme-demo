//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

struct ExampleTextView: View {
	
	var body: some View {
		ThemeVStack(alignment: .leading) {
			ThemeVStack(alignment: .leading) {
				Text("Scene Header")
					.theme(text: .screenHeader)
				Text("Scene Header Subtitle")
					.theme(text: .screenHeaderSubtitle)
			}
			.theme(padding: .spacingTextHeader, .bottom)
			
			Text("Font for longer text blocks. Usually consisting of multiple sentences and spanning more than a single line. Sometimes even more to have an actual block. Using key: .textBlock")
				.fixedSize(horizontal: false, vertical: true)
				.theme(text: .textBlock)
				.theme(padding: .spacingSections, .bottom)
			
			Text("Scene Section Header")
				.theme(text: .screenSectionHeader)
				.theme(padding: .spacingTextHeader, .bottom)
			
			Text("Text Title")
				.theme(text: .textTitle)
				.theme(padding: .spacingTextTitle, .bottom)
			
			ThemeVStack(alignment: .leading, spacing: .spacingTextBlock) {
				Text("Font for longer text blocks. Usually consisting of multiple sentences and spanning more than a single line. Sometimes even more to have an actual block. Using key: .textBlock")
					.fixedSize(horizontal: false, vertical: true)
					.theme(text: .textBlock)
				Text("Font for longer text blocks. Usually consisting of multiple sentences and spanning more than a single line. Sometimes even more to have an actual block. Using key: .textBlock")
					.fixedSize(horizontal: false, vertical: true)
					.theme(text: .textBlock)
			}
			.theme(padding: .spacingGroups, .bottom)
			
			ThemeVStack(alignment: .leading) {
				Text("Title of a text block")
					.theme(text: .textTitle)
				Text("Text Subtitle")
					.theme(text: .textSubtitle)
			}
			.theme(padding: .spacingTextTitle, .bottom)
			
			ThemeVStack(alignment: .leading, spacing: .spacingTextBlock) {
				Text("Font for longer text blocks. Usually consisting of multiple sentences and spanning more than a single line. Sometimes even more to have an actual block. Using key: .textBlock")
					.fixedSize(horizontal: false, vertical: true)
					.theme(text: .textBlock)
				ThemeHStack(spacing: .spacingElements) {
					ThemeLabel(text: "Text Label", icon: .favorite)
						.labelStyle(.themeTag())
					ThemeLabel(text: "Label Style Tag")
						.labelStyle(.themeTag())
				}
				ThemeHStack(spacing: .spacingElements) {

					Text("Text Icon")
						.theme(text: .textIcon)
					Text("Text Value")
						.theme(text: .textValue)
				}
				Text("Text Footnote")
					.theme(text: .textFootnote)
			}
			.theme(padding: .spacingSections, .bottom)
			
			HStack {
				VStack {
					Button {} label: {
						ThemeLabel(text: "Secondary")
							.labelStyle(.themeButtonSecondary)
					}
					.buttonStyle(.themeSecondary)
				}
				Spacer()
				VStack {
					Button {} label: {
						ThemeLabel(text: "Primary", icon: .favorite)
							.labelStyle(.themeButtonPrimary)
					}
					.buttonStyle(.themePrimary)
				}
			}
			.frame(maxWidth: .infinity)
		}
		.frame(
			maxWidth: .infinity,
			maxHeight: .infinity,
			alignment: .leading
		)
	}
}

	
// MARK: - Previews

#Preview {
	
	ExampleTextView()
		.padding(20)
		.environment(\.theme, Theme.baseApp.replacingDefinitions(
//			fonts: ThemeConfig.fontsIndicatorDict
		))
	
}
