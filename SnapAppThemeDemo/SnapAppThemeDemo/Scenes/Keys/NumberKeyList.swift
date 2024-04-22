//
//  NumberKeyList.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 08.05.23.
//

import SwiftUI
import SnapCore
import SnapTheme

struct NumberKeyList: View {
	
	@Environment(\.theme) private var theme
	
	var body: some View {
		
		ThemeKeyList {
			Group {

				ThemeKeyListSections(baseKeys: Theme.NumberKey.allBaseKeys, appKeys: Theme.NumberKey.allAppKeys) { key in
					ListItem(key: key)
				}
				
			}
		}
		
	}
	
	
	// MARK: - ListItem
	
	struct ListItem: View {
		
		@Environment(\.theme) private var theme
		
		let key: Theme.NumberKey
		
		var body: some View {
			
			let shouldPreventDisable = theme.numbers.count == 0
			let hasDefinition = theme.numbers[key] != nil
			
			HStack {
				Text(key.key)
					.frame(maxWidth: .infinity, alignment: .leading)
					.theme(font: .listLabel)
				
				Group {
					if let number = theme.number(key) {
						Text(String(format: "%.1f", number))
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
	
	NumberKeyList()
		.environment(\.theme, Theme(
			icons: [:],
			numbers: [
				.spacingSections : .value(10),
			],
			colors: [:],
			fonts: [:]
		))
	
}
