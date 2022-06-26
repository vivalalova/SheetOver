//
//  Modifier.swift
//  FloatingPanel
//
//  Created by Lova on 2022/6/27.
//

import SwiftUI

public
extension View {
    func sheetOver<T: View>(
        position: SheetView<T>.CardPosition = .tall,
        allowedPositions: [SheetView<T>.CardPosition] = [.tall, .compact, .short],
        content: @escaping () -> T
    ) -> some View {
        self.modifier(
            SheetViewModifier(
                position: position,
                allowedPositions: allowedPositions,
                content: content
            )
        )
    }
}

public
struct SheetViewModifier<T: View>: ViewModifier {
    let position: SheetView<T>.CardPosition
    let allowedPositions: [SheetView<T>.CardPosition]

    let content: () -> T

    public func body(content: Content) -> some View {
        ZStack {
            content

            SheetView(position: position, allowedPositions: allowedPositions) {
                self.content()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}