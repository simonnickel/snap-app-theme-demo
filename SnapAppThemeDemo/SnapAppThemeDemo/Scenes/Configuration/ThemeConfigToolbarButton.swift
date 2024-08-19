//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
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
