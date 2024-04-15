//
//  FontKeyList.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 08.05.23.
//

import SwiftUI
import SnapTheme

struct FontKeyList: View {
	
	@Environment(\.theme) private var theme
	
	@State private var showDetails: Bool = false
	
	var body: some View {
		
		ThemeKeyList {
			Group {
				
				Section(content: {
					Toggle(isOn: $showDetails) {
						Text("Show Details")
					}
					.themeListRow()
				})
				
				ThemeKeyListSections(baseKeys: Theme.FontKey.allBaseKeys, appKeys: Theme.FontKey.allAppKeys) { key in
					ListItem(key: key, showDetails: $showDetails)
				}
				
			}
		}
	}
	
	
	// MARK: - ListItem
	
	struct ListItem: View {
		
		@Environment(\.theme) private var theme
		
		let key: Theme.FontKey
		@Binding var showDetails: Bool
		
		var body: some View {
			
			let shouldPreventDisable = theme.fonts.count == 0
			let hasDefinition = theme.fonts[key] != nil
			ThemeVStack(alignment: .leading, spacing: .spacingLines) {
				Text(key.key)
					.theme(font: key)
				
				if showDetails {
					Details
						.theme(font: .textFootnote)
				}
			}
			.theme(color: shouldPreventDisable || hasDefinition ? .foreground : .foregroundDisabled)
			.themeListRow()
			
		}
		
		var Details: some View {
			if let font = theme.fontDefinition(for: key) {
				return Text("\(String(format: "%.0f", font.size)), \(font.weight.rawValue), \(font.textStyle.rawValue)")
			} else {
				return Text("Not defined")
			}
			
		}
		
	}
	
}


// MARK: - Previews

#Preview {
	
	FontKeyList()
		.environment(\.theme, Theme(
			icons: [:],
			values: [:],
			colors: [:],
			fonts: [:]
		))
	
}
