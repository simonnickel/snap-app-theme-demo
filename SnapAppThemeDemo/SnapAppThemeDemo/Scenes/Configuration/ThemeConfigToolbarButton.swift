//
//  ThemeConfigToolbarButton.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 26.06.23.
//

import SwiftUI
import SnapTheme

struct ThemeConfigToolbarButton: View {
	
	@Environment(\.appStateBinding) private var appStateBinding
	
	var body: some View {
		
		Button {
			appStateBinding.showThemeConfiguration.wrappedValue.toggle()
		} label: {
			ThemeLabel(
				text: "Theme Config",
				icon: .toolbarThemeConfig
			)
		}
		.buttonStyle(.themeNavbarIcon)

	}
}
