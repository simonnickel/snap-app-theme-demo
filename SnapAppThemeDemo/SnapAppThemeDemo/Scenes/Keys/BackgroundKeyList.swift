//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

struct BackgroundKeyList: View {
	
	@Environment(\.theme) private var theme
	
	var body: some View {
			
		ThemeKeyList {
			Group {
				
				ThemeKeyListSections(baseKeys: Theme.BackgroundKey.allBaseKeys, appKeys: Theme.BackgroundKey.allAppKeys) { key in
					ListItem(key: key)
				}
				
			}
		}
			
	}
	
	
	// MARK: - ListItem
	
	struct ListItem: View {
		
		@Environment(\.theme) private var theme
		
		let key: Theme.BackgroundKey
		
		var body: some View {
			
			let shouldPreventDisable = theme.icons.count == 0
			let hasDefinition = theme.backgrounds[key] != nil
			
			HStack {
				
				SplitBackgroundContainer {
					Rectangle()
						.fill(.clear)
						.frame(height: 40)
						.theme(background: key)
				}
				.frame(maxWidth: 100)
				
				Text(key.key)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
			.theme(font: .listLabel)
			.theme(color: shouldPreventDisable || hasDefinition ? .foreground : .foregroundDisabled)
			.themeListRow()
			
		}
	}

}


// MARK: - Previews

#Preview {
	
	BackgroundKeyList()
		.environment(\.theme, Theme(
			icons: [:],
			numbers: [:],
			colors: [:],
			fonts: [:]
		))
	
}

