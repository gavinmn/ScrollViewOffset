import SwiftUI

public struct ScrollViewOffset<Content>: View where Content: View {
	let axes: Axis.Set
	let content: () -> Content
	let onScroll: (CGFloat) -> Void
	
	init(axes: Axis.Set = .vertical, @ViewBuilder content: @escaping () -> Content, onScroll: @escaping (CGFloat) -> Void) {
		self.axes = axes
		self.content = content
		self.onScroll = onScroll
	}
	
	struct ScrollViewOffsetPreferenceKey: PreferenceKey {
		typealias Value = CGFloat
		static var defaultValue: CGFloat { 0 }
		static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
			value = nextValue()
		}
	}
	
	public var body: some View {
		ScrollView(axes) {
			content()
				.overlay(
					GeometryReader { geometry in
						if axes == .horizontal {
							Color.clear
								.preference(key: ScrollViewOffsetPreferenceKey.self, value: geometry.frame(in: .named("scrollView")).origin.x)
						} else {
							Color.clear
								.preference(key: ScrollViewOffsetPreferenceKey.self, value: geometry.frame(in: .named("scrollView")).origin.y)
						}
					}
				)
		}
		.onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
			onScroll(value)
		}
		.coordinateSpace(name: "scrollView")
	}
}
