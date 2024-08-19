//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore
import SnapTheme
import SnapTemplateShared

struct ToolbarButtonSettings: View {
	
	@Environment(\.templateStateBinding) private var templateStateBinding
	
	var body: some View {
		
		Button {
			templateStateBinding.showSettings.wrappedValue.toggle()
		} label: {
			ThemeLabel(
				text: "Settings",
				icon: .settings
			)
		}

	}
}
