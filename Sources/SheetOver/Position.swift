//
//  Position.swift
//  SheetOver
//
//  Created by Lova on 2022/6/27.
//

import SwiftUI

public
extension SheetOver {
    enum Position: Equatable {
        case full(scrollable: Bool = false)
        case tall(scrollable: Bool = false)
        case half(scrollable: Bool = false)
        case short(scrollable: Bool = false)

        case toTop(_ distance: CGFloat, scrollable: Bool = false)
        case toBottom(_ distance: CGFloat, scrollable: Bool = false)

        case closed

        /// Top Distance to SafeArea
        /// - Parameter readerHeight: self height
        /// - Returns: distance to safe area
        func distance(readerHeight: CGFloat) -> CGFloat {
            switch self {
            case .full:
                return 0
            case .tall:
                return 80
            case .half:
                return readerHeight * 0.5
            case .short:
                return readerHeight - 200
            case let .toTop(distance, _):
                return distance
            case let .toBottom(distance, _):
                return readerHeight - distance
            case .closed:
                return readerHeight
            }
        }

        public var isScrollable: Bool {
            switch self {
            case let .full(scrollable),
                 let .tall(scrollable),
                 let .half(scrollable),
                 let .short(scrollable),
                 let .toTop(_, scrollable),
                 let .toBottom(_, scrollable):
                return scrollable
            case .closed:
                return false
            }
        }
    }
}
