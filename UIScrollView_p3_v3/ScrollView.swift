//
//  ScrollView.swift
//  UIScrollView_p3_v3
//
//  Created by macbook pro  on 8/30/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class ScrollView: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    
    let photo = UIImageView()
    var pageImages: [String] = []
    var first = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageImages = ["Chii_Be_01", "Chii_Be_02", "Chii_Be_03"]
        pageController.currentPage = 0
        pageController.numberOfPages = pageImages.count
        scrollView.delegate = self
        scrollView.backgroundColor = UIColor.blackColor()
        
    }
    
    override func viewDidLayoutSubviews() {
        
        if (!first) {
            first = true
            let scrollSize = scrollView.frame.size
            let pageCount = pageImages.count
            scrollView.contentSize = CGSizeMake(scrollSize.width * CGFloat(pageCount), 0)
            for (var i = 0; i < pageCount; i++) {
                let photo = UIImageView(image: UIImage(named: pageImages[i] + ".jpg"))
                photo.frame = CGRectMake(CGFloat(i) * scrollSize.width, 0, scrollSize.width, scrollSize.height)
                photo.contentMode = .ScaleAspectFit
                self.scrollView.addSubview(photo)
            }
        }
        
    }
    
    @IBAction func pageControllerAction(sender: UIPageControl) {
        
        scrollView.contentOffset = CGPointMake(CGFloat(pageController.currentPage) * scrollView.frame.size.width, 0)
        
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        
        pageController.currentPage = Int(page)
        
    }
    
//    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        
//        let page = scrollView.contentOffset.x / scrollView.frame.size.width
//        
//        pageController.currentPage = Int(page)
//        
//    }
    
    
    
    
    
    
    
    
}
