//
//  MainViewController.swift
//  DemoBottomsheet
//
//  Created by Shiv on 20/08/19.
//  Copyright © 2019 MVD. All rights reserved.
//

import UIKit
import OverlayContainer

class MainViewController: UIViewController {
    
    var storyboardV = UIStoryboard(name: "Main", bundle: nil)
    enum OverlayNotch: Int, CaseIterable {
        case minimum, maximum
    }
    
    @IBOutlet var overlayContainerView: UIView!
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet private var widthConstraint: NSLayoutConstraint!
    @IBOutlet private var trailingConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        let bottomVC = storyboardV.instantiateViewController(withIdentifier: "BottomSheetViewController")
        
        let overlayController = OverlayContainerViewController()
        overlayController.delegate = self
        overlayController.viewControllers = [bottomVC]

        addChild(overlayController, in: overlayContainerView)
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillLayoutSubviews() {
//        setUpConstraints(for: view.bounds.size)
//        super.viewWillLayoutSubviews()
//    }
    
    private func setUpConstraints(for size: CGSize) {
        if size.width > size.height {
            trailingConstraint.isActive = false
            widthConstraint.isActive = true
        } else {
            trailingConstraint.isActive = true
            widthConstraint.isActive = false
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainViewController: OverlayContainerViewControllerDelegate {
    
    // MARK: - OverlayContainerViewControllerDelegate
    
    func numberOfNotches(in containerViewController: OverlayContainerViewController) -> Int {
        return OverlayNotch.allCases.count
    }
    
    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
                                        heightForNotchAt index: Int,
                                        availableSpace: CGFloat) -> CGFloat {
        let notch = OverlayNotch.allCases[index]
        
        switch notch {
        case .maximum:
            return availableSpace
        case .minimum:
            return availableSpace * 1 / 4
        }
    }
    
    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
                                        scrollViewDrivingOverlay overlayViewController: UIViewController) -> UIScrollView? {
        return (overlayViewController as? BottomSheetViewController)?.tvList
    }
    
//    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
//                                        shouldStartDraggingOverlay overlayViewController: UIViewController,
//                                        at point: CGPoint,
//                                        in coordinateSpace: UICoordinateSpace) -> Bool {
//        guard let header = (overlayViewController as? SearchViewController)?.header else {
//            return false
//        }
//        let convertedPoint = coordinateSpace.convert(point, to: header)
//        return header.bounds.contains(convertedPoint)
//    }
}


extension UIViewController {
    func addChild(_ child: UIViewController, in containerView: UIView) {
        guard containerView.isDescendant(of: view) else { return }
        addChild(child)
        containerView.addSubview(child.view)
        child.view.pinToSuperview()
        child.didMove(toParent: self)
    }
    
    func removeChild(_ child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}

extension UIView {
    func pinToSuperview(with insets: UIEdgeInsets = .zero, edges: UIRectEdge = .all) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        if edges.contains(.top) {
            topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
        }
        if edges.contains(.bottom) {
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom).isActive = true
        }
        if edges.contains(.left) {
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left).isActive = true
        }
        if edges.contains(.right) {
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right).isActive = true
        }
    }
}

