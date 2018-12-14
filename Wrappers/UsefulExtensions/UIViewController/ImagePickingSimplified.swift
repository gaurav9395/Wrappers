//import UIKit
//import GSImageViewerController
//
//protocol ImagePickerRemoveImageDelegate {
//    func userTappedOnRemoveButton()
//}
//var removeImageDelegate: ImagePickerRemoveImageDelegate?
//
//extension UIViewController {
//    struct ImagePicking {
//        static var imageSelected = Bool()
//        static var imageView = UIImageView()
//        static var imagePicker = UIImagePickerController()
//    }
//    
//    private func openCamera(isVideoAllowed: Bool, editingAllowed: Bool) {
//        DispatchQueue.main.async {
//            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
//                ImagePicking.imagePicker.sourceType = UIImagePickerController.SourceType.camera
//                if isVideoAllowed {
//                    ImagePicking.imagePicker.mediaTypes =  ["public.image", "public.movie"]
//                    ImagePicking.imagePicker.videoMaximumDuration = 15
//                }
//                ImagePicking.imagePicker.allowsEditing = editingAllowed
//                self.present(ImagePicking.imagePicker, animated: true, completion: nil)
//            }  else {
//                self.showAlertControllerWith(message: .cameraSupport, buttons: .ok(nil))
//            }
//        }
//    }
//    
//    private func openGallery(isVideo: Bool, editingAllowed: Bool) {
//        ImagePicking.imagePicker.allowsEditing = editingAllowed
//        ImagePicking.imagePicker.sourceType = .photoLibrary
//        if isVideo {
//            ImagePicking.imagePicker.mediaTypes =  ["public.image", "public.movie"]
//            ImagePicking.imagePicker.videoMaximumDuration = 15
//        }
//        present(ImagePicking.imagePicker, animated: true, completion: nil)
//    }
//    
//    /**
//     Method used to present the image picker actionsheet for selecting images from device or camera
//     - parameter imagePicker: Object of imagePicker in your view controller
//     - parameter isVideoRequired: Do you need to display images from the device
//     - parameter editingAllowed: is editing allowed for the picked images
//     - parameter isRemoveRequired: true if you need to display the remove image button
//     */
//    func pickImage(forImageView imageView: UIImageView, isVideoRequired: Bool = false,
//                             editingAllowed: Bool = true) {
//        ImagePicking.imagePicker.delegate = self
//        let alert = UIAlertController(title: "SELECTOPTION".localized, message: nil, preferredStyle: .actionSheet)
//        let cameraAction = UIAlertAction(title: "CAMERA".localized, style: .default) {
//            UIAlertAction in
//            self.openCamera(isVideoAllowed: isVideoRequired, editingAllowed: editingAllowed)
//        }
//        let gallaryAction = UIAlertAction(title: "PHOTOS".localized, style: .default) {
//            UIAlertAction in
//            self.openGallery(isVideo: isVideoRequired, editingAllowed: editingAllowed)
//        }
//        let cancelAction = UIAlertAction(title: "CANCEL".localized, style: .cancel) {
//            UIAlertAction in
//        }
//        
//        alert.addAction(cameraAction)
//        alert.addAction(gallaryAction)
//        if ImagePicking.imageSelected {
//            let removeAction = UIAlertAction(title: "REMOVE".localized, style: .default) {
//                UIAlertAction in
//                ImagePicking.imageView.image = nil
//                ImagePicking.imageSelected = false
//            }
//            alert.addAction(removeAction)
//        }
//        alert.addAction(cancelAction)
//        if let presenter = alert.popoverPresentationController {
//            presenter.sourceView = view
//            presenter.sourceRect = view.bounds
//        }
//        present(alert, animated: true, completion: nil)
//    }
//    
//    func displayWebserviceError(message: String, with code: Int) {
//        if code != 404 {
//            self.showAlertControllerWith(message: .custom(message), buttons: .ok(nil))
//        }
//    }
//    
//    /**
//     Method to show a image in zoomed in method so that the user can zoom and see the whole image in detailed manner
//     - parameter sender: the image view that contains the image
//     */
//    func displayImageFrom(sender: UIImageView) {
//        let imageInfo = GSImageInfo(image: sender.image ?? #imageLiteral(resourceName: "defaultImage"), imageMode: .aspectFit, imageHD: nil)
//        let transitionInfo = GSTransitionInfo(fromView: sender)
//        let imageViewer = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transitionInfo)
//        present(imageViewer, animated: true, completion: nil)
//    }
//}
//
////MARK: - Image picker delegates
//extension UIViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    private func imagePickerController(_ picker: UIImagePickerController,
//                               didFinishPickingMediaWithInfo info: [String : Any]) {
//        DispatchQueue.main.async {
//            if let mediaType = info[UIImagePickerController.InfoKey.mediaType.rawValue] as? String {
//                if mediaType  == "public.image" {
//                    if let image = info[picker.allowsEditing ? UIImagePickerController.InfoKey.editedImage.rawValue:
//                        UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage {
//                        ImagePicking.imageView.image = image
//                        ImagePicking.imageSelected = true
//                    }
//                }
//            }
//        }
//        picker .dismiss(animated: true)
//    }
//    
//    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true)
//    }
//}
