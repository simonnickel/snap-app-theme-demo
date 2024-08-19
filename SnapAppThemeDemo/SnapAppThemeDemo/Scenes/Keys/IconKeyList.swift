//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

struct IconKeyList: View {
	
	@Environment(\.theme) private var theme
	
	var body: some View {
			
		ThemeKeyList {
			Group {
				
				ThemeKeyListSections(baseKeys: Theme.IconKey.allBaseKeys, appKeys: Theme.IconKey.allAppKeys) { key in
					ListItem(key: key)
				}
				
			}
		}
			
	}
	
	
	// MARK: - ListItem
	
	struct ListItem: View {
		
		@Environment(\.theme) private var theme
		
		let key: Theme.IconKey
		
		var body: some View {
			
			let shouldPreventDisable = theme.icons.count == 0
			let hasDefinition = theme.icons[key] != nil
			
			HStack {
				Text(key.key)
					.frame(maxWidth: .infinity, alignment: .leading)
				
				let icon = theme.icon(key)
				icon.image
			}
			.theme(font: .listLabel)
			.theme(color: shouldPreventDisable || hasDefinition ? .foreground : .foregroundDisabled)
			.themeListRow()
			
		}
	}
}


// MARK: - Previews

#Preview {
	
	IconKeyList()
		.environment(\.theme, Theme(
			icons: [:],
			numbers: [:],
			colors: [:],
			fonts: [:]
		))
	
}
