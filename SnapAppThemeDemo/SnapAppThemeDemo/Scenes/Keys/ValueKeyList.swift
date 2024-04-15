//
//  ValueKeyList.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 08.05.23.
//

import SwiftUI
import SnapCore
import SnapTheme

struct ValueKeyList: View {
	
	@Environment(\.theme) private var theme
	
	var body: some View {
		
		ThemeKeyList {
			Group {

				ThemeKeyListSections(baseKeys: Theme.ValueKey.allBaseKeys, appKeys: Theme.ValueKey.allAppKeys) { key in
					ListItem(key: key)
				}
				
			}
		}
		
	}
	
	
	// MARK: - ListItem
	
	struct ListItem: View {
		
		@Environment(\.theme) private var theme
		
		let key: Theme.ValueKey
		
		var body: some View {
			
			let shouldPreventDisable = theme.values.count == 0
			let hasDefinition = theme.values[key] != nil
			
			HStack {
				Text(key.key)
					.frame(maxWidth: .infinity, alignment: .leading)
					.theme(font: .listLabel)
				
				Group {
					if let value = theme.value(key) {
						Text(String(format: "%.1f", value))
					} else {
						Text("nil")
					}
				}
				.theme(font: .listValue)
			}
			.theme(color: shouldPreventDisable || hasDefinition ? .foreground : .foregroundDisabled)
			.themeListRow()
		}
	}
	
}


// MARK: - Previews

#Preview {
	
	ValueKeyList()
		.environment(\.theme, Theme(
			icons: [:],
			values: [
				.spacingSections : 10,
			],
			colors: [:],
			fonts: [:]
		))
	
}
