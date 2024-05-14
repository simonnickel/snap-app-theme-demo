//
//  AppDependencies.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 04.10.23.
//

import SwiftUI
import Observation
import SnapTemplateShared

/// Definition and application of dependenies to use in the app.
@Observable class AppDependencies {
	
	private let templateDependencies: TemplateDependencies
	private var appState: AppState
	
	init(templateDependencies: TemplateDependencies, appState: AppState = AppState()) {
		
		self.templateDependencies = templateDependencies
		self.appState = appState
		
	}
	
	
	// MARK: - Apply
	
	/// Apply dependencies defined in project. See `TemplateDependencies` for template defined dependencies.
	func apply<Content: View>(on content: Content) -> some View {

		// Apply Theme Config
		var theme = templateDependencies.templateState.theme
		for config in appState.themeConfigs {
			if config == ThemeConfig.colorsBase {
				// Do not apply base color config, would override accent color from settings.
			} else {			
				theme = config.apply(theme)
			}
		}
		
		return content
			.theme(apply: theme) // Already applied in TemplateDependencies, but has to applied again because of config changes.
			.environment(\.appState, appState)
			.environment(\.appStateBinding, Binding(get: {
				self.appState
			}, set: { newValue in
				self.appState = newValue
			}))
		
	}
	
}
