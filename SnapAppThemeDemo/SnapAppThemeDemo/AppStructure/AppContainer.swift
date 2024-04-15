//
//  AppContainer.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 12.10.23.
//

import SwiftUI
import SnapTheme
import SnapTemplateShared

/// A container to apply app specific customisation to the content.
struct AppContainer<Content: View>: View {
	
	// Access to AppState via Environment
	@Environment(\.appState) private var appState
	@Environment(\.appStateBinding) private var appStateBinding
	@Environment(\.templateStateBinding) private var templateStateBinding
	
	@ViewBuilder private let content: () -> Content

	init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content
	}
	
	var body: some View {
	
		content()
			.onChange(of: appState.showThemeConfiguration, { oldValue, newValue in
				if oldValue == false && newValue == true {
					templateStateBinding.navigationSplitSidebarVisibility.wrappedValue = .detailOnly
				}
			})
			.modalPresentation(style: .automaticFixed, isPresented: appStateBinding.showThemeConfiguration, content: {
				ThemeCloseContainer() {
					ThemeConfigScene()
				} onClose: {
					appStateBinding.showThemeConfiguration.wrappedValue = false
				}
				.themeModal()
				
			})
		
	}
	
}
