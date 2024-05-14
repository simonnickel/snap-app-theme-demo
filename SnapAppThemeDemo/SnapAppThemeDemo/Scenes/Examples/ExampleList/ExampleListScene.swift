//
//  ExampleListScene.swift
//  SnapAppThemeDemo
//
//  Created by Simon Nickel on 13.09.23.
//

import SwiftUI
import SnapCore
import SnapTheme

struct ExampleListScene: View {
	
	@State private var selectedStyle: Theme.ThemeListStyle = .automatic
	@State private var prominentHeader: Bool = true
	@State private var showIcons: Bool = false
	
	private let loopSelectionState = ExampleListLoop.SelectionState()
	private let loopItem = ExampleListLoop.ListItem(title: "List Navigation Loop")
	
	var body: some View {AnyView( // Style.listStyle has to return any ListStyle.
		ThemeScreenList(
			title: selectedStyle.rawValue,
			listStyle: selectedStyle
		) {
			
			
			// MARK: Configuration
			
			Section {

				ThemePickerListRow(selection: $selectedStyle, options: Theme.ThemeListStyle.allCases) {
					ThemeLabel(text: "List Style", icon: .navLists, style: .themeListRow())
				}

				PickerTapable(selection: $selectedStyle) {
					ForEach(Theme.ThemeListStyle.allCases, id: \.self) { style in
						ThemeLabel(text: style.rawValue)
							.tag(style)
					}
				} label: {
					ThemeLabel(text: "List Style", icon: .navLists, style: .themeListRow())
				}
				
				ToggleTapable(isOn: $prominentHeader, label: {
					ThemeLabel(text: "Prominent Header", icon: .favorite)
						.labelStyle(.themeListRow())
				})
				.themeListRow()
				
				ToggleTapable(isOn: $showIcons, label: {
					ThemeLabel(text: "Show Header Icons", icon: .favorite)
						.labelStyle(.themeListRow())
				})
				.themeListRow()
			}
			
			
			// MARK: Navigation
			
			ExampleListSection(header: "Navigation", footer: nil, prominent: prominentHeader, showIcons: showIcons) {
				NavigationLink(value: loopItem) {
					ThemeLabel(text: loopItem.title, icon: .accessoryNavigation)
						.labelStyle(.themeListRow())
				}
				.themeListRow(isSelected: loopSelectionState.selectedItems.contains(loopItem))
			}
			
			
			// MARK: ThemeListRow
			
			ExampleListSection(header: "Theme List Row", footer: ".themeListRow modifier applies padding and background color. LabelStyle applies font and color.", prominent: prominentHeader, showIcons: showIcons) {
				
				Rectangle()
					.fill(.gray)
					.opacity(0.3)
					.themeListRow()
				
				ThemeLabel(text: "ThemeListRow, labelStyle: .themeListRow()", icon: .favorite)
					.labelStyle(.themeListRow())
					.themeListRow()
				
				ThemeLabel(text: "ThemeListRow, labelStyle: .themeListRow(highlightIcon: false)", icon: .favorite)
					.labelStyle(.themeListRow(highlightIcon: false))
					.themeListRow()
				
			}
			
			
			// MARK: Plain
			
			Section {
				Label {
					Text("Label")
				} icon: {
					Image(systemName: "star")
				}
				ThemeLabel(text: "Theme Icon Label", icon: .favorite)
				
				NavigationLink(value: loopItem) {
					ThemeLabel(text: "NavigationLink", icon: .favorite)
				}
			} header: {
				Label {
					Text("Plain Section")
				} icon: {}
			} footer: {
				Label {
					Text("Plain Footer")
				} icon: {}
			}
			
			
			// MARK: ExampleListRow
			
			ExampleListSection(header: "Example List Row Variants", footer: nil, prominent: prominentHeader, showIcons: showIcons) {
				ExampleListRowVariants()
			}
			
			
			// MARK: Buttons
			
			ThemeListButton(text: "List Buttons", placement: .top) {}
			ThemeListButton(text: "In a Group", placement: .middle) {}
			ThemeListButton(text: "Of 3 Items", placement: .bottom) {}
			
		}
			.navigationDestination(for: ExampleListLoop.ListItem.self) { item in
				ExampleListLoop()
					.navigationTitle(item.title)
					.onAppear {
						loopSelectionState.selectedItems.append(item)
					}
					.onDisappear {
						loopSelectionState.selectedItems.removeAll(where: { $0 == item })
					}
					.environment(loopSelectionState)
			}
	)}
	
}


// MARK: - Previews

#Preview {
	
	NavigationStack {
		
		ExampleListScene()
		
	}
	.environment(\.theme, .baseApp.replacingDefinitions(
//		colors: ThemeConfig.colorsIndicatorDict
	))
	
}
