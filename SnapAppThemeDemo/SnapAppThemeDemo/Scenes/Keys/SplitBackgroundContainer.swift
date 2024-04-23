//
//  SplitBackgroundContainer.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 15.11.23.
//

import SwiftUI
import SnapTheme

internal struct SplitBackgroundContainer<Content: View>: View {
	
	@Environment(\.self) var environment
	@Environment(\.theme) private var theme
	
	@ViewBuilder let content: () -> Content
	
	var body: some View {
		
		let color1 = theme.color(for: .backgroundScene, in: environment)
		let color2 = theme.color(for: .backgroundContent, in: environment)
		
		ZStack {
			HStack(spacing: 0) {
				Rectangle()
					.fill(color1)
				Rectangle()
					.fill(color2)
			}
			ThemeVStack {
				content()
			}
			.theme(padding: .spacingElements)
		}
	
	}
}
