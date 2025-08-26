import SwiftUI

struct WrappingHStack: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlexibleView(spacing: spacing, proposal: proposal, views: subviews)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlexibleView(spacing: spacing, proposal: proposal, views: subviews)
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.frames[index].minX, y: bounds.minY + result.frames[index].minY), proposal: ProposedViewSize(result.frames[index].size))
        }
    }
}

struct FlexibleView {
    let spacing: CGFloat
    let proposal: ProposedViewSize
    let views: LayoutSubviews
    var size = CGSize.zero
    var frames: [CGRect] = []
    
    init(spacing: CGFloat, proposal: ProposedViewSize, views: LayoutSubviews) {
        self.spacing = spacing
        self.proposal = proposal
        self.views = views
        
        guard !views.isEmpty else { return }
        
        var frames: [CGRect] = []
        var x: CGFloat = 0
        var y: CGFloat = 0
        var lineHeight: CGFloat = 0
        let maxWidth: CGFloat = proposal.width ?? 0
        
        for view in views {
            let viewSize = view.sizeThatFits(.unspecified)
            
            if x + viewSize.width > maxWidth && x > 0 {
                x = 0
                y += lineHeight + spacing
                lineHeight = 0
            }
            
            frames.append(CGRect(x: x, y: y, width: viewSize.width, height: viewSize.height))
            lineHeight = max(lineHeight, viewSize.height)
            x += viewSize.width + spacing
        }
        
        var currentRowFrames: [Int] = []
        var currentY: CGFloat = 0
        
        for (index, frame) in frames.enumerated() {
            if frame.minY != currentY {
                if !currentRowFrames.isEmpty {
                    let rowWidth = frames[currentRowFrames.last!].maxX
                    let offset = (maxWidth - rowWidth + spacing) / 2
                    for rowIndex in currentRowFrames {
                        frames[rowIndex].origin.x += offset
                    }
                }
                currentRowFrames = [index]
                currentY = frame.minY
            } else {
                currentRowFrames.append(index)
            }
        }
        
        if !currentRowFrames.isEmpty {
            let rowWidth = frames[currentRowFrames.last!].maxX
            let offset = (maxWidth - rowWidth + spacing) / 2
            for rowIndex in currentRowFrames {
                frames[rowIndex].origin.x += offset
            }
        }
        
        self.frames = frames
        self.size = CGSize(width: maxWidth, height: (frames.last?.maxY ?? 0))
    }
}
