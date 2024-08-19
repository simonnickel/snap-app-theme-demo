//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

struct ColorKeyList: View {
	
	@Environment(\.theme) private var theme
	
	var body: some View {
		
		ThemeKeyList {
			Group {
				
				ThemeKeyListSections(baseKeys: Theme.ColorKey.allBaseKeys, appKeys: Theme.ColorKey.allAppKeys) { key in
					ListItem(key: key)
				}
				
			}
		}
		
	}
	
	
	// MARK: - ListItem
	
	struct ListItem: View {
		
		@Environment(\.self) var environment
		@Environment(\.theme) private var theme
		@ScaledMetric private var scaleFactor: CGFloat = 1
		
		let key: Theme.ColorKey
		
		var body: some View {
			
			let colorValue = theme.colorValue(for: key)
			let color = theme.color(for: key, in: environment)
			
			ThemeHStack(spacing: .spacingGroups) {
				ThemeShape(.rectangle(.cornerRadiusElement))
					.theme(surface: Theme.SurfaceKey.color(key))
					.frame(width: 35 * theme.scale(with: scaleFactor), height: 35 * theme.scale(with: scaleFactor))
				
				let shouldPreventDisable = theme.colors.count == 0
				let hasDefinition = theme.colors[key] != nil
				
				VStack(alignment: .leading) {
					Text(key.key)
						.theme(font: .listTitle)
					Text(colorValue.description)
						.theme(font: .listSubtitle)
					Text(colorString(color))
						.theme(font: .listFooter)
				}
				.theme(color: shouldPreventDisable || hasDefinition ? .foreground : .foregroundDisabled)
			}
			
		}
		
		private func colorString(_ color: Color) -> String {
			let resolved = color.resolve(in: environment)
			return "R: \(CGFloat(resolved.red).round(decimals: 3)), G: \(CGFloat(resolved.green).round(decimals: 3)), B: \(CGFloat(resolved.blue).round(decimals: 3)), A: \(CGFloat(resolved.opacity).round(decimals: 3))"
		}
	}
	
}


// MARK: - Previews

#Preview {
	
	return ColorKeyList()
		.environment(\.theme, Theme(
			icons: [:],
			numbers: [:],
			colors: [
				:
					//				.background : .color(.green),
			],
			fonts: [:]
		))
	
}
