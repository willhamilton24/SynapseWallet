//
//  CaptureImageView.swift
//  Synapse
//
//  Created by Will Hamilton on 11/19/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI
import UIKit

struct CaptureImageView {
    
    /// MARK: - Properties
    @Binding var isShown: Bool
    @Binding var image: UIImage?
    
    func makeCoordinator() -> Coordinator {
      return Coordinator(isShown: $isShown, image: $image)
    }
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}
