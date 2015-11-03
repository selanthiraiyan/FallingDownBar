//
//  ViewController.swift
//  FallingDownBar
//
//  Created by Sharma Elanthiraiyan on 30/10/15.
//  Copyright © 2015 Sharma Elanthiraiyan. All rights reserved.
//

import UIKit

let BottomLineIdentifier = "BottomLine"
struct Bar {
    let x: CGFloat
    let size: CGSize!
    let backgroundColor: UIColor?
}

class ViewController: UIViewController {
    
    var bottomLine: UIView!
    var bars: [Bar]!
    var animator: UIDynamicAnimator!
    var viewsThatNeedGravity: [UIDynamicItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bars =  [
            Bar(x: 10, size: CGSizeMake(50, 100), backgroundColor: .redColor()),
            Bar(x: 100, size: CGSizeMake(70, 200), backgroundColor: .greenColor()),
            Bar(x: 200, size: CGSizeMake(100, 300), backgroundColor: .blueColor())

        ]
        self.createViews()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createViews() {
        self.bottomLine = UIView(frame: CGRectMake(0, self.view.frame.size.height - 10, self.view.frame.size.width, 2))
        self.bottomLine.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.bottomLine)
        animator = UIDynamicAnimator(referenceView: self.view)
        
        for bar in bars {
            createViewsForBar(bar)
        }
        
        let gravityBehaviour = UIGravityBehavior(items: viewsThatNeedGravity)
        gravityBehaviour.magnitude = 0.5
        self.animator.addBehavior(gravityBehaviour)
        
        let collisionBehaviour = UICollisionBehavior(items: viewsThatNeedGravity)
        collisionBehaviour.addBoundaryWithIdentifier(BottomLineIdentifier, fromPoint: self.bottomLine.frame.origin, toPoint: CGPointMake(self.bottomLine.frame.origin.x + self.bottomLine.frame.size.width, self.bottomLine.frame.origin.y))
        animator.addBehavior(collisionBehaviour)
        
        let elasticityBehaviour = UIDynamicItemBehavior(items: viewsThatNeedGravity)
        elasticityBehaviour.elasticity = 0.52
        animator.addBehavior(elasticityBehaviour)
    }
    
    
    func createViewsForBar(bar: Bar) {
        let splittedBarHeight = bar.size.height / 10
        let initialVerticalGapBetweenSplittedBars = 100 as CGFloat
        for i in 0...10 {
            let view = UIView(frame: CGRectMake(bar.x, -(initialVerticalGapBetweenSplittedBars * CGFloat(i)), bar.size.width, splittedBarHeight))
            view.tag = i
            if let backgroundColor = bar.backgroundColor {
                view.backgroundColor = backgroundColor
            }
            self.view.addSubview(view)
            viewsThatNeedGravity.append(view)
            
            //To keep the views in fixed y axis
            let attachmentBehaviour = UIAttachmentBehavior.slidingAttachmentWithItem(view, attachmentAnchor: view.center, axisOfTranslation: CGVectorMake(0, 1))
            animator.addBehavior(attachmentBehaviour)
        }
    }
    
}

