//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

struct ExampleListRowVariants: View {
	
	let itemsComplex: [ExampleListRow.Item] = [
		.exampleFull,
		.init(icon: nil, title: "Title and Text", subtitle: nil, label: nil, textBlock: "Some words to form a sentence with no meaning, but great placeholder value.", tag: [], value: "Value", footnote: nil),
		.init(icon: nil, title: "Item with Subtitle", subtitle: "Subtitle sentence with words", label: nil, textBlock: nil, tag: [], value: "Value", footnote: nil),
		.init(icon: nil, title: "List Item Title", subtitle: "Subtitle sentence with words", label: nil, textBlock: "Some words to form a sentence with no meaning, but great placeholder value.", tag: [], value: "Value", footnote: ".footnote"),
		.init(icon: nil, title: "Another List Item", subtitle: nil, label: nil, textBlock: nil, tag: [], value: "99999", footnote: nil),
		.init(icon: nil, title: ".listTitle", subtitle: ".listSubtitle", label: ".listText", textBlock: ".textBlcok", tag: [.init(text: ".listLabel")], value: ".listValueTitle", footnote: ".footnote"),
	]
	
	var body: some View {

		ForEach(itemsComplex, id:\.id) { item in
			ExampleListRow(item: item)
		}

	}
	
}


// MARK: - Previews

#Preview {
	
	List {
		
		ExampleListRowVariants()
		
	}
	.environment(\.theme, .baseApp)
	
}
