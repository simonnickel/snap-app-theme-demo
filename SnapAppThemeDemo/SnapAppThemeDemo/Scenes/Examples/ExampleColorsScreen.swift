//
//  ExampleColorsScreen.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 13.09.23.
//

import SwiftUI
import SnapTheme

struct ExampleColorsScreen : View {
	
	@Environment(\.theme) private var theme
	
	@State private var contentIsSelected: Bool = false
	@State private var textIsSelected: Bool = false
	
	var body: some View {
		
		ThemeScene {
			
			viewBackground
			viewText
			viewButtons
			
		}
		
	}
	
	
	// MARK: - View Background
	
	private var viewBackground: some View {
		
		VStack {
			
			ThemeSectionHeaderContainer(top: nil, inset: .cardPadding) {
				ThemeLabel(text: "Background")
					.labelStyle(.themeSectionHeader(prominent: true))
			}
			
			BackgroundToggleContainer { isContent, isHighlighted in
				ThemeVStack(alignment: .leading, spacing: .cardPadding) {
					
					Text((isContent ? ".content\(isHighlighted ? ", highlighted" : "")" : ".scene" ) + " (tap to switch)")
						.theme(font: .labelTag)
					
					ThemeCard(style: .contentSecondary, level: .first) {
						Text(".contentSecondary")
							.theme(text: .labelTag)
							.frame(maxWidth: .infinity, alignment: .leading)
					}
					
					ThemeHStack(spacing: .cardPadding) {
						ThemeCard(style: .accent, level: .first) {
							Text(".accent")
								.theme(font: .labelTag)
								.theme(color: .foregroundOnBackground)
								.frame(maxWidth: .infinity, alignment: .leading)
						}
						
						ThemeCard(style: .accent, level: .first, highlighted: true) {
							Text(".accent, highlighted")
								.theme(font: .labelTag)
								.theme(color: .foregroundOnBackground)
								.frame(maxWidth: .infinity, alignment: .leading)
						}
					}
				
				}
				
			}
			
		}
		
	}
	
	
	// MARK: - View Text
	
	private var viewText: some View {
		
		let accentColors = theme.colorSet(for: .accentColors)
		
		return VStack {
			
			ThemeSectionHeaderContainer(inset: .cardPadding) {
				ThemeLabel(text: "Foreground")
					.labelStyle(.themeSectionHeader(prominent: true))
			}
			
			BackgroundToggleContainer { _, _ in
				ThemeVStack(alignment: .leading, spacing: .spacingElements) {
					
					ThemeHStack(spacing: .spacingElements) {
						Text(".foreground")
							.theme(font: .listHeader)
							.theme(color: .foreground)
					}
					
					ThemeHStack(spacing: .spacingElements) {
						Text(".foregroundSecondary")
							.theme(font: .listHeader)
							.theme(color: .foregroundSecondary)
						Text(".foregroundDisabled")
							.theme(font: .listHeader)
							.theme(color: .foregroundDisabled)
					}
					
					ThemeHStack(spacing: .spacingElements) {
						Text(".accentColors.accent")
							.theme(font: .listHeader)
							.theme(color: .accentColor)
						Text(".accentColors.complimentary")
							.theme(font: .listHeader)
							.if(unwrap: accentColors?.complimentary, transform: { view, complimentary in
								view.theme(color: complimentary)
							})
					}
					
					ThemeHStack(spacing: .spacingElements) {
						Text(".destructive")
							.theme(font: .listHeader)
							.theme(color: .destructive)
						Text("."+Theme.ColorKey.exampleColor.key)
							.theme(font: .listHeader)
							.theme(color: .exampleColor)
					}
					
					ThemeVStack(alignment: .leading, spacing: .spacingGroups) {
						
						HStack {
							Text(".foregroundOnBG")
								.theme(font: .listHeader)
								.theme(color: .foregroundOnBackground)
							
							Text(".accentColors.complementary")
								.theme(font: .listHeader)
								.if(unwrap: accentColors?.complementary, transform: { view, complementary in
									view.theme(color: complementary)
								})
						}
						.frame(maxWidth: .infinity, alignment: .leading)
					}
					.themeCard(.accent, level: .first)
					
				}
			}
			
		}
		
	}
	
	// MARK: - View Buttons
		
	private var viewButtons: some View {
		
		VStack {
			
			ThemeSectionHeaderContainer(inset: .cardPadding) {
				ThemeLabel(text: "Buttons")
					.labelStyle(.themeSectionHeader(prominent: true))
			}
			
			BackgroundToggleContainer { _, _  in
				
				ThemeVStack(alignment: .leading, spacing: .spacingGroups) {
					
					Button(action: {}) {
						ThemeLabel(text: "Destructive", icon: .delete)
							.labelStyle(.themeButtonPrimary)
					}
					.buttonStyle(.themeDestructive)
					.frame(maxWidth: .infinity, alignment: .center)
					
					ThemeHStack(spacing: .spacingElements) {
						Button(action: {}) {
							ThemeLabel(text: "Secondary")
								.labelStyle(.themeButtonSecondary)
						}
						.buttonStyle(.themeSecondary)
						
						Spacer()
						
						Button(action: {}) {
							ThemeLabel(text: "Primary Button")
								.labelStyle(.themeButtonPrimary)
						}
						.buttonStyle(.themePrimary)
					}
					.frame(maxWidth: .infinity, alignment: .trailing)
					
				}
				.frame(maxWidth: .infinity, alignment: .center)

			}
			
		}
		
	}
	
}


// MARK: - Previews

#Preview {
	
	return ExampleColorsScreen()
		.environment(\.theme, .baseApp
			.replaceAccent(base: .yellow)
			.replacingDefinitions(
				surfaces: [
					//				.accentForeground : .key(.accentGradientBackground),
					//				.accentBackground : .key(.accentGradientBackground),
					.interactiveForeground : .key(.accentGradientForeground),
					.interactiveBackground : .key(.accentGradientBackground),
				]
			))
	
}

