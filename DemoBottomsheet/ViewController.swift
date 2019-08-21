//
//  ViewController.swift
//  DemoBottomsheet
//
//  Created by Shiv on 20/08/19.
//  Copyright © 2019 MVD. All rights reserved.
//

import UIKit
import OverlayContainer

class ViewController: UIViewController {
    
    var storyboardV = UIStoryboard(name: "Main", bundle: nil)
//    @IBOutlet var overlayContainerView: UIView!
//    @IBOutlet private var widthConstraint: NSLayoutConstraint!
//    @IBOutlet private var trailingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clk_Back (_ sender: UIButton){
        
//        let bottomVC = storyboardV.instantiateViewController(withIdentifier: "BottomSheetViewController")
        let mainVC = storyboardV.instantiateViewController(withIdentifier: "MainViewController")
        
//        let containerController = OverlayContainerViewController()
//        containerController.delegate = self
//        containerController.viewControllers = [
//            mainVC,
//            bottomVC
//        ]
        
        self.navigationController?.pushViewController(mainVC, animated: true)
        
    }

}

//extension ViewController: OverlayContainerViewControllerDelegate {
//    
//    enum OverlayNotch: Int, CaseIterable {
//        case minimum, maximum
//    }
//    
//    func numberOfNotches(in containerViewController: OverlayContainerViewController) -> Int {
//       return OverlayNotch.allCases.count
//    }
//    
//    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
//                                        heightForNotchAt index: Int,
//                                        availableSpace: CGFloat) -> CGFloat {
//        switch OverlayNotch.allCases[index] {
//        case .maximum:
//            return availableSpace
////        case .medium:
////            return availableSpace / 2
//        case .minimum:
//            return availableSpace * 1 / 4
//        }
//    }
//    
//    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
//                                        scrollViewDrivingOverlay overlayViewController: UIViewController) -> UIScrollView? {
//        return (overlayViewController as? BottomSheetViewController)?.tvList
//    }
//    
//}

