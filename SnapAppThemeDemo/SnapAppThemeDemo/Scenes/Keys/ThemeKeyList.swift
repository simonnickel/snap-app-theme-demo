//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore
import SnapTheme


// MARK: - ThemeKeyList

struct ThemeKeyList<Content: View>: View {
	
	@ViewBuilder let contentBuilder: () -> Content
	
	var body: some View {
		
		ThemeScreenList {
			
			contentBuilder()
			
		}
		
	}
	
}


// MARK: - ThemeKeyListSections

struct ThemeKeyListSections<ValueType: Theme.KeyProtocolRequirements, RowType: View>: View {
		
	@Environment(\.theme) private var theme

	internal init(baseKeys: [Theme.Key<ValueType>], appKeys: [Theme.Key<ValueType>], @ViewBuilder rowBuilder: @escaping RowBuilder) {
		self.baseKeys = baseKeys
		self.appKeys = appKeys
		self.sections = Dictionary(
			grouping: baseKeys,
			by: { String($0.key.split(by: .uppercaseLetters).first ?? "") }
		)
		self.rowBuilder = rowBuilder
	}
	
	let baseKeys: [Theme.Key<ValueType>]
	let appKeys: [Theme.Key<ValueType>]
	private let sections: [String : [Theme.Key<ValueType>]]
	
	typealias RowBuilder = (_ key: Theme.Key<ValueType>) -> RowType
	@ViewBuilder let rowBuilder: RowBuilder
	
	var body: some View {
		
		ForEach(sections.sorted(by: { $0.key < $1.key }), id: \.key) { section in
			Section {
				ForEach(section.value, id: \.self) { key in
					rowBuilder(key)
				}
			} header: {
				Text(section.key)
					.theme(text: .listHeader)
			}
		}
		
		if appKeys.count > 0 {
			Section {
				ForEach(appKeys, id: \.self) { key in
					rowBuilder(key)
				}
			} header: {
				Text("Custom Keys")
					.theme(text: .listHeader)
			}
		}
		
	}
	
}
