//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

struct SurfaceKeyList: View {
	
	@Environment(\.theme) private var theme
	
	var body: some View {
			
		ThemeKeyList {
			Group {
				
				ThemeKeyListSections(baseKeys: Theme.SurfaceKey.allBaseKeys, appKeys: Theme.SurfaceKey.allAppKeys) { key in
					ListItem(key: key)
				}
				
			}
		}
			
	}
	
	
	// MARK: - ListItem
	
	struct ListItem: View {
		
		@Environment(\.theme) private var theme
		
		let key: Theme.SurfaceKey
		
		var body: some View {
			
			let shouldPreventDisable = theme.icons.count == 0
			let hasDefinition = theme.surfaces[key] != nil
			
			HStack {
				
				SplitBackgroundContainer {
					VStack {
						Image(systemName: "rectangle.fill")
							.font(.largeTitle)
						
						Text("Example")
							.fontWeight(.black)
					}
					.theme(surface: key)
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
	
	SurfaceKeyList()
		.environment(\.theme, Theme(
			icons: [:],
			numbers: [:],
			colors: [:],
			fonts: [:]
		))
	
}


