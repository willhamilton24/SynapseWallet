//
//  TakeImageView.swift
//  Synapse
//
//  Created by Will Hamilton on 11/19/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI
import UIKit

struct TakeImageView {
  @Binding var isShown: Bool
  @Binding var image: UIImage?
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(isShown: $isShown, image: $image)
  }
}

extension TakeImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<TakeImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<TakeImageView>) {
        
    }
}
