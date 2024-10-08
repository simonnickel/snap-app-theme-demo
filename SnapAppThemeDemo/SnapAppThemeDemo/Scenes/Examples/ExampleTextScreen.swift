//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

struct ExampleTextScreen: View {
	
	var body: some View {
		
		ThemeScreen {
			
			ThemeSectionHeaderContainer(top: nil, inset: .cardPadding) {
				ThemeLabel(text: "Label Style Section Header")
					.labelStyle(.themeSectionHeader(prominent: true))
			}
			
			ExampleTextView()
				.themeCard(.content)
				
			ThemeSectionHeaderContainer(inset: .cardPadding) {
				ThemeLabel(text: "Card")
					.labelStyle(.themeSectionHeader(textCase: .uppercase, prominent: false))
			}
			
			ThemeVStack(spacing: .spacingGroups) {
				
				ExampleCardView()
				
				ThemeCornerView(model: .init(icon: .favorite, title: "Card Title", text: "Card Subtitle", value: "123", isSelected: true))
					.themeCard(.accent)
				
			}
			
			ThemeSectionHeaderContainer(inset: .cardPadding) {
				ThemeLabel(text: "List")
					.labelStyle(.themeSectionHeader(textCase: .uppercase, prominent: false))
			}

			ExampleListRow(item: .exampleFull)
				.themeCard(.content)
			
		}
		.navigationDestination(for: String.self) { value in
			Text(value)
		}
		
	}
	
}


// MARK: - Previews

#Preview {
	
	ExampleTextScreen()
		.environment(\.theme, .baseApp.replacingDefinitions(
//			fonts: ThemeConfig.fontsIndicatorDict
		))
	
}
