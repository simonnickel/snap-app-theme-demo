//
//  TextSurfaceKeyList.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 28.06.23.
//

import SwiftUI
import SnapTheme

struct TextSurfaceKeyList: View {
	
	@Environment(\.theme) private var theme
	
	var body: some View {
		
		ThemeKeyList {
			Group {
				 
				let customKeys = theme.textSurfaces.filter({ element in
					!Theme.TextSurfaceKey.definitionsBase.keys.contains(element.key)
				}).map({ $0.key })
				
				ThemeKeyListSections(baseKeys: Theme.TextSurfaceKey.definitionsBase.map({ $0.key }), appKeys: customKeys) { key in
					ListItem(fontKey: key)
				}
				
			}
		}
		
	}
	
	
	// MARK: - ListItem
	
	struct ListItem: View {
		
		@Environment(\.theme) private var theme
		
		let fontKey: Theme.FontKey
		
		var body: some View {
			
			let surface = theme.textSurface(fontKey)
			
			let shouldPreventDisable = theme.textSurfaces.count == 0
			let hasDefinition = theme.textSurfaces[fontKey] != nil
			
			HStack {
				Text(fontKey.key)
					.theme(font: .listLabel)
					.theme(color: shouldPreventDisable || hasDefinition ? .foreground : .foregroundDisabled)
					.frame(maxWidth: .infinity, alignment: .leading)
				
				Text(surface.description)
					.theme(surface: surface)
					.theme(font: fontKey)
			}
			.themeListRow()
		}
	}
	
}


// MARK: - Previews

#Preview {
	
	TextSurfaceKeyList()
		.environment(\.theme, Theme(
			icons: [:],
			values: [:],
			colors: [:],
			fonts: [:],
			textSurfaces: [:]
		))
	
}
