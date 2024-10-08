//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapSettingsService
import SnapMatchingNavigation
import SnapTemplateShared

struct NavTabScene: View {

	@EnvironmentObject private var destinationFactory: AppDestinationFactory

	let tabsSetting: SettingsService.Value<TabConfiguration?>
	
	@State private var selectedTab: MNavItem.ID = AppDestination.initial.id
	
	var body: some View {
		
		let configuration = tabsSetting.value
		let tabs = AppDestination.tabs(with: configuration)
		
		if tabs.count > 0 {
			
			MNavTabScene(tabs: tabs, selected: $selectedTab, tabScreen: { tabItem in
				if let item = tabItem as? AppDestination {
					
					TemplateNavigationStack(factory: destinationFactory, root: item, mode: .tab)

				}
			})
			// Tab Scene has to be reloaded on tab order change. Otherwise things go wrong.
			.id(configuration.hashValue)
			.onAppear() {
				if let initial = tabsSetting.value?.initial?.id {
					selectedTab = initial
				}
			}
			
		} else {
			
			ThemeVStack(spacing: .spacingGroups) {			
				ThemeEmptyDecorationView(text: "Tabs not configured correctly.", icon: .warning)
				
				// Available Tabs should always be added to configured Tabs. So this should never be necessary to display.
				Button(action: {
					tabsSetting.set(nil)
				}, label: {
					ThemeLabel(text: "Reset Configuration")
						.labelStyle(.themeButtonSecondary)
				})
				.buttonStyle(.themeSecondary)
			}
			
		}
		
	}
	
}


// MARK: - Preview

#Preview {
	
	NavTabScene(tabsSetting: SettingsService().value(.navigationTabs))
		.environment(\.theme, .baseApp)
	
}
