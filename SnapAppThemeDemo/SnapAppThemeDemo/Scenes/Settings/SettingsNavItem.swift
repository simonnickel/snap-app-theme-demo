//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTemplateShared

enum SettingsNavItem: Codable {
	
	case tabs
	
	var title: String {
		switch self {
			case .tabs: "Configure Tabs"
		}
	}
	
	
	// MARK: - Destination
	
	@MainActor
	var destination: any View {
		destinationPlain
			.navigationTitle(title)
	}
	
	@MainActor
	var destinationPlain: any View {
		switch self {
				
			case .tabs: ConfigureTabsScreen(defaultConfiguration: AppDestination.tabConfigDefault)
				
		}
	}
	
}
