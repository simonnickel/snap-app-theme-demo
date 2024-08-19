//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import Observation
import SnapCore
import SnapTheme

struct ExampleListLoop: View {
	
	@Observable class SelectionState {
		var selectedItems: [ExampleListLoop.ListItem] = []
	}
	
	struct ListItem: Identifiable, Hashable {
		let id: UUID = UUID()
		let title: String
	}
	
	@Environment(ExampleListLoop.SelectionState.self) private var selectionState
	
	private let items: [ListItem] = {
		(0..<10).map({ ListItem(title: "Row \($0)") })
	}()
	
	var body: some View {
			
		List {
			ForEach(items, id: \.id) { item in
				NavigationLink(value: item) {
					Text(item.title)
				}
				.themeListRow(isSelected: selectionState.selectedItems.contains(item))
			}
		}

	}
}
