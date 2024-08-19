//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

struct ExampleListSection<Content: View>: View {
	
	@Environment(\.theme) private var theme
	
	let header: String?
	let footer: String?
	let prominent: Bool
	let showIcons: Bool
	private var icon: Theme.IconKey? {
		showIcons ? .favorite : nil
	}
	
	@ViewBuilder let content: () -> Content
	
	var body: some View {
		
		Section {
			content()
		} header: {
			if let header {
				ThemeLabel(text: header, icon: icon)
					.labelStyle(.themeSectionHeader(prominent: prominent))
			}
		} footer: {
			if let footer {
				ThemeLabel(text: footer, icon: icon)
					.labelStyle(.themeSectionFooter)
			}
		}
	
	}

}


// MARK: - Previews

#Preview {
	
	List {
		
		ExampleListSection(header: nil, footer: nil, prominent: true, showIcons: true) {
			Text("Test")
		}
		
	}
	.environment(\.theme, .baseApp)
	
}
