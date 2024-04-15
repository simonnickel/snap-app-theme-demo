//
//  BackgroundToggleContainer.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 05.12.23.
//

import SwiftUI
import SnapTheme

struct BackgroundToggleContainer<Content: View>: View {
	
	@ViewBuilder let content: () -> Content
	
	@State private var background: Theme.BackgroundKey = .content
	@State private var highlighted: Bool = false
	
	public var body: some View {
		ThemeCard(
			style: .custom(color: .foreground, background: background),
			highlighted: highlighted
		) {
			content()
		}
		.contentShape(Rectangle())
		.onTapGesture {
			switch (background, highlighted) {
				case (.content, false): highlighted = true
				case (.content, true): 
					background = .scene
					highlighted = false
				case (.scene, _): background = .content
				default: break
			}
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	ThemePreviewContainer(.view) {
		
		Section {
			
			BackgroundToggleContainer {
				Text("Tap me")
			}
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "ThemePreviewContainer", style: .themeSectionHeader(prominent: true))
			}
		}
		
	}
	
}

