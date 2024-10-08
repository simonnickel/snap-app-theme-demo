//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import Observation
import SnapTemplateShared

/// Definition and application of dependenies to use in the app.
@Observable class AppDependencies: DependencyContainer {

	private let templateDependencies: TemplateDependencies
	private var appState: AppState
	
	init(templateDependencies: TemplateDependencies, appState: AppState = AppState()) {
		
		self.templateDependencies = templateDependencies
		self.appState = appState
		
	}
	
	
	// MARK: - Apply
	
	/// Apply dependencies defined in project. See `TemplateDependencies` for template defined dependencies.
	@MainActor
	func apply<Content: View>(on content: Content) -> any View {

		// Apply Theme Config
		var theme = templateDependencies.theme
		for config in appState.themeConfigs {
			if config == ThemeConfig.colorsBase {
				// Do not apply base color config, would override accent color from settings.
			} else {			
				theme = config.apply(theme)
			}
		}
		
		return content
			.fontDesign(nil) // Override fontDesign set in TemplateDependencies, otherwise custom fonts will break.
			.theme(apply: theme) // Already applied in TemplateDependencies, but has to applied again because of config changes.
			.environment(\.appState, appState)
			.environment(\.appStateBinding, Binding(get: {
				self.appState
			}, set: { newValue in
				self.appState = newValue
			}))
			.environmentObject(AppDestinationFactory(dependencies: self))
		
	}
	
}
