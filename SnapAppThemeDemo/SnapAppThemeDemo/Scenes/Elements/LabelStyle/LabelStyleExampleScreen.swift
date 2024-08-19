//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore
import SnapTheme

struct LabelStyleExampleScreen: View {
	
	let model: LabelStyleModel
	
	var body: some View {
		
		ThemeScreen(title: model.name) {
			
			ThemeVStack(alignment: .leading, spacing: .spacingGroups) {
				
				LabelStyleExampleSections(model: model)
				
			}
			.scenePadding([.horizontal])
			
		}
		
	}
	
}

struct LabelStyleExampleSections: View {
	
	@Environment(\.theme) private var theme
	@ScaledMetric private var scaleFactor: CGFloat = 1
	
	let model: LabelStyleModel
	
	var body: some View {
		
		Section {
			
			ThemeLabel(
				text: model.name,
				icon: .favorite,
				style: AnyLabelStyle(model.style)
			)
			.themeCard(model.cardStyle ?? .content)
			
			
		} header: {
			ThemeLabel(text: "Default", style: ThemeLabelStyleSectionHeader(prominent: true))
		}
		
		if model.styleOptions.count > 0 {
			Section {
				
				ForEach(model.styleOptions) { model in
					ThemeLabel(
						text: model.name,
						icon: .favorite,
						style: AnyLabelStyle(model.style)
					)
					.themeCard(model.cardStyle ?? .content)
				}
				
			} header: {
				ThemeSectionHeaderContainer {
					ThemeLabel(text: "Options", style: ThemeLabelStyleSectionHeader(prominent: true))
				}
			}
		}
		
		Section {
			
			Label(
				title: { Text("Label") },
				icon: { theme.icon(.favorite).image }
			).themeCard()
			
			ThemeLabel(
				text: "ThemeLabel",
				icon: .favorite
			).themeCard()
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "Compare with Plain Style", style: ThemeLabelStyleSectionHeader(prominent: true))
			}
		}
		
		Section {

			ThemeLabel(
				text: "ThemeLabelStyleListRow",
				style: AnyLabelStyle(model.style)
			).themeCard(model.cardStyle ?? .content)
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "Missing params", style: ThemeLabelStyleSectionHeader(prominent: true))
			}
		}
		
		Section {
			
			Text("ThemeLabel(style: \(model.apiExtension ?? ""))")
				.theme(text: .textFootnote)
			
			Text(".labelStyle(\(model.apiExtension ?? ""))")
				.theme(text: .textFootnote)
			
			Text(".labelStyle(\(model.apiFull ?? ""))")
				.theme(text: .textFootnote)
			
		} header: {
			ThemeSectionHeaderContainer {
				ThemeLabel(text: "API Options", style: ThemeLabelStyleSectionHeader(prominent: true))
			}
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	LabelStyleExampleScreen(model: .themeTag)
		.environment(\.theme, .base)
	
}


