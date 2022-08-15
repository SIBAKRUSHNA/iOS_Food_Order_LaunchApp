//
//  ContentLayoutHelper.swift
//  Food Order
//
//  Created by Mobiotics on 13/08/22.
//

import Foundation
import UIKit
public enum DisplayType: String {
    case SQUARE
    case LANDSCAPE
    case PORTRAIT
}
struct ContentLayout {
    var right: CGFloat
    var left: CGFloat
    var cellSpace: CGFloat
    var width: CGFloat
    var layout: DisplayType
    var cellCount: CGFloat
}
class ContentLayoutHelper: NSObject {
    private var contentLayout: ContentLayout!
    private var multiplier: CGFloat {
        switch contentLayout.layout {
        case .LANDSCAPE:
            return 0.56
        case .SQUARE:
            return 1
        case .PORTRAIT:
            return 1.5
        }
    }
    init(_ layout: ContentLayout) {
        super.init()
        contentLayout = layout
    }
    public func fetchCellSize() -> CGSize {
        let cellCount = contentLayout.cellCount
        let reducedWidth = contentLayout.width - contentLayout.left - contentLayout.right
        let roundedCellCount: CGFloat = round(cellCount)
        switch contentLayout.layout {
        case .LANDSCAPE:
            let cellWidth = (reducedWidth - (contentLayout.cellSpace * (roundedCellCount - 1))) / cellCount
                        return CGSize(width: cellWidth, height: cellWidth * multiplier)
        case .SQUARE:
            let cellWidth = (reducedWidth - (contentLayout.cellSpace * (roundedCellCount - 1))) / cellCount
            let cellHeight = cellWidth * 1.46
            return CGSize(width: cellWidth, height: cellHeight)
        case .PORTRAIT:
            let cellWidth = (reducedWidth - (contentLayout.cellSpace * (roundedCellCount - 1))) / cellCount
            let cellHeight = cellWidth * 2
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
}

