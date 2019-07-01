//
//  ImageZoomView.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

private let minZoomScale: CGFloat = CGFloat(1.0)
private let maxZoomScale: CGFloat = CGFloat(5.0)
private let numberOfTapsRequired: Int = 2
private let splitInHalf: CGFloat = CGFloat(2.0)

class ImageZoomView: UIScrollView, UIScrollViewDelegate {
    var imageView: UIImageView!
    var gestureRecognizer: UITapGestureRecognizer!

    convenience init(frame: CGRect, image: UIImage) {
        self.init(frame: frame)
        
        self.initializer(image)
    }

    private func initializer(_ image: UIImage) {
        self.imageView = UIImageView(image: image)
        self.imageView.frame = frame
        self.imageView.contentMode = .scaleAspectFit
        self.addSubview(self.imageView)

        self.setupScrollView(image: image)
        self.setupGestureRecognizer()
    }

    func setupScrollView(image: UIImage) {
        self.delegate = self

        self.minimumZoomScale = minZoomScale
        self.maximumZoomScale = maxZoomScale
    }

    func setupGestureRecognizer() {
        self.gestureRecognizer = UITapGestureRecognizer(target: self,
                                                        action: #selector(handleDoubleTap))
        self.gestureRecognizer.numberOfTapsRequired = numberOfTapsRequired

        self.addGestureRecognizer(self.gestureRecognizer)
    }
    
    @IBAction func handleDoubleTap() {
        if self.zoomScale == minZoomScale {
            self.zoom(to: zoomRectForScale(self.maximumZoomScale,
                                           center: self.gestureRecognizer.location(in: self.gestureRecognizer.view)),
                      animated: true)
        } else {
            self.setZoomScale(minZoomScale,
                              animated: true)
        }
    }

    func zoomRectForScale(_ scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = self.imageView.frame.size.height / scale
        zoomRect.size.width = self.imageView.frame.size.width / scale

        let newCenter = convert(center, from: self.imageView)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / splitInHalf)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / splitInHalf)

        return zoomRect
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}

