//
//  ExampleTextView.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 13.09.23.
//

import SwiftUI
import SnapTheme

struct ExampleTextView: View {
	
	var body: some View {
		ThemeVStack(alignment: .leading, spacing: .spacingGroups) {
			ThemeVStack(alignment: .leading, spacing: .spacingTextHeader) {
				ThemeVStack(alignment: .leading) {
					Text("Scene Header")
						.theme(text: .sceneHeader)
					Text("Scene Header Subtitle")
						.theme(text: .sceneHeaderSubtitle)
				}
				Text("Font for longer text blocks. Usually consisting of multiple sentences and spanning more than a single line. Sometimes even more to have an actual block. Using key: .textBlock")
					.fixedSize(horizontal: false, vertical: true)
					.theme(text: .textBlock)
			}
			
			ThemeVStack(alignment: .leading, spacing: .spacingTextHeader) {
				Text("Scene Section Header")
					.theme(text: .sceneSectionHeader)
				ThemeVStack(alignment: .leading, spacing: .spacingTextTitle) {
					Text("Text Title")
						.theme(text: .textTitle)
					ThemeVStack(alignment: .leading, spacing: .spacingElements) {
						Text("Font for longer text blocks. Usually consisting of multiple sentences and spanning more than a single line. Sometimes even more to have an actual block. Using key: .textBlock")
							.fixedSize(horizontal: false, vertical: true)
							.theme(text: .textBlock)
						Text("Font for longer text blocks. Usually consisting of multiple sentences and spanning more than a single line. Sometimes even more to have an actual block. Using key: .textBlock")
							.fixedSize(horizontal: false, vertical: true)
							.theme(text: .textBlock)
					}
				}
			}
			
			ThemeVStack(alignment: .leading, spacing: .spacingTextTitle) {
				Text("Title of a text block")
					.theme(text: .textTitle)
				
				ThemeVStack(alignment: .leading, spacing: .spacingElements) {
					Text("Font for longer text blocks. Usually consisting of multiple sentences and spanning more than a single line. Sometimes even more to have an actual block. Using key: .textBlock")
						.fixedSize(horizontal: false, vertical: true)
						.theme(text: .textBlock)
					Text("Text Footnote")
						.theme(text: .textFootnote)
					HStack {
						ThemeLabel(text: "Text Tag", icon: .favorite)
							.labelStyle(.themeTag())
						ThemeLabel(text: "Text Tag")
							.labelStyle(.themeTag())
					}
				}
			}
			
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
