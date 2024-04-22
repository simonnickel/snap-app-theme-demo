//
//  NavItemDestinationWrapper.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 10.01.24.
//

import SwiftUI
import SnapMatchingNavigation

extension NavItem {
	
	func destination(for mode: MNavContainer.Mode) -> any View {
		return destinationBase(for: mode)
			.toolbar {
				ToolbarItem(placement: .automatic) {
					ThemeConfigToolbarButton()
				}
			}
	}
	
}

struct NavItemDestinationWrapper: View {
	
//	@Environment(\.dataSource) private var dataSource
	
	let navItem: NavItem
	
	var body: some View {
		switch navItem {
				
			case .exampleColors: ExampleColorsScreen()
			case .exampleText: ExampleTextScreen()
			case .exampleLists: ExampleListScene()
				
			case .elementLabelStyles: LabelStylesList()
				
			case .keysColor: ColorKeyList()
			case .keysSurface: SurfaceKeyList()
			case .keysBackground: BackgroundKeyList()
			case .keysFont: FontKeyList()
			case .keysTextSurface: TextSurfaceKeyList()
			case .keysNumber: NumberKeyList()
			case .keysIcon: IconKeyList()
				
			default: AnyView(navItem.destinationDefault())
				
		}
	}
	
}
