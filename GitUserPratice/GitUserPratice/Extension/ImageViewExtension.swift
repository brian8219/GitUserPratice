//
//  ImageViewExtension.swift
//  GitUserPratice
//
//  Created by 楊子逸 on 2021/12/15.
//
import UIKit
extension UIImageView {
    func makeRounded() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
