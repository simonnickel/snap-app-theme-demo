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
		
		return content
			.environment(\.appState, appState)
			.environment(\.appStateBinding, Binding(get: {
				self.appState
			}, set: { newValue in
				self.appState = newValue
			}))
		
	}
	
}