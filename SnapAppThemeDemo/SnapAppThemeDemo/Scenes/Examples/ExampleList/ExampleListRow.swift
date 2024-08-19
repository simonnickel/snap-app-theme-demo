//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

struct ExampleListRow: View {
	
	@Environment(\.theme) private var theme
	
	let item: Item
	
	struct Item: Identifiable {
		let id = UUID()
		let icon: Theme.IconKey?
		let title: String
		let subtitle: String?
		let label: String?
		let textBlock: String?
		let tag: [TagModel]
		let value: String
		let footnote: String?
		
		static let exampleFull: Item = .init(icon: .favorite, title: "Full List Title", subtitle: "Subtitle sentence with words", label: "Label of the row", textBlock: "Some words to form a sentence with no meaning, but great placeholder value.", tag: [.init(text: "Tag", icon: .settings), .init(text: "Tag"), .init(text: "Whatever it is")], value: "123", footnote: "Footnote")
		
		struct TagModel: Identifiable {
			internal init(text: String, icon: Theme.IconKey? = nil) {
				self.text = text
				self.icon = icon
			}
			
			let id = UUID()
			let text: String
			let icon: Theme.IconKey?
		}
	}
	
	var body: some View {
		ThemeHStack(alignment: .center, spacing: .spacingElements) {
			ThemeVStack(alignment: .leading, spacing: .spacingGroups) {
				
				ThemeHStack(spacing: .spacingGroups) {
					
					if let icon = item.icon {
						theme.icon(icon).image
					}
					
					VStack(alignment: .leading) {
						Text(item.title)
							.theme(text: .listTitle)
						if let subtitle = item.subtitle {
							Text(subtitle)
								.theme(text: .listSubtitle)
						}
					}
				}
				
				if item.label != nil || item.textBlock != nil || item.footnote != nil {
					ThemeVStack(alignment: .leading, spacing: .spacingElements) {
						if let text = item.label {
							Text(text)
								.theme(text: .listLabel)
						}
						
						if let textBlock = item.textBlock {
							Text(textBlock)
								.theme(text: .listBlock)
						}
						
						if let footnote = item.footnote {
							Text(footnote)
								.theme(text: .listFootnote)
						}
					}
					
				}
				
				if item.tag.count > 0 {
					// TODO idea: Could be a multiline flow layout. Seems to be more complicated than it should be though. https://swiftwithmajid.com/2022/11/16/building-custom-layout-in-swiftui-basics/
					ThemeHStack(spacing: .spacingElements) {
						ForEach(item.tag, id:\.id) { component in
							ThemeLabel(
								text: component.text,
								icon: component.icon,
								style: .themeTag()
							)
							.lineLimit(2)
						}
					}
				}
				
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			
			VStack(alignment: .trailing) {
				Text(item.value)
					.theme(text: .listValue)
			}
			.frame(alignment: .trailing)
		}
		.themeListRow()
	}
}


// MARK: - Previews

#Preview {
	
	List {
		
		ExampleListRow(item: .exampleFull)
		
	}
	.environment(\.theme, .baseApp)
	
}
