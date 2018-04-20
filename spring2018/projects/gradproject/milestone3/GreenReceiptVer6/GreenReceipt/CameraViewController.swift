//
//  CameraViewController.swift
//  GreenReceipt
//
//  Created by Gabriel Chapel on 4/17/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    @IBOutlet weak var previewView: UIView!
    
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var capturePhotoOutput:AVCapturePhotoOutput?
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        captureSession?.stopRunning() //stop camera
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func takePicture(_ sender: UIButton) {
        // Make sure capturePhotoOutput is valid
        guard let capturePhotoOutput = self.capturePhotoOutput else{
            return
        }
        let photoSettings = AVCapturePhotoSettings()
        photoSettings.isAutoStillImageStabilizationEnabled = true
        photoSettings.isHighResolutionPhotoEnabled = true
        photoSettings.flashMode = .auto
        
        capturePhotoOutput.capturePhoto(with: photoSettings, delegate: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if AVCaptureDevice.authorizationStatus(for: .video)  == .authorized {
            self.runCamera()
        } else{
            AVCaptureDevice.requestAccess(for: .video, completionHandler: {(granted: Bool) in
                if granted {
                    self.runCamera()
                } else{
                    print("The user did not grant permission")
                }
            })
        }
    }
    
    //Setup the camera and display preview
    func runCamera(){
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            capturePhotoOutput = AVCapturePhotoOutput()
            capturePhotoOutput?.isHighResolutionCaptureEnabled = true
            captureSession?.addOutput(capturePhotoOutput!)
        } catch {
            print(error)
        }
        // Camera preview
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = previewView.layer.bounds
        previewView.layer.addSublayer(videoPreviewLayer!)
        
        // Start camera session
        captureSession?.startRunning()
    }
    
    // Function for retreiving the picture
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard error == nil else{
            print("Error capturing photo: \(String(describing: error))")
            return
        }
        if let imageData = photo.fileDataRepresentation() {
            if let capturedImage = UIImage.init(data: imageData, scale: 1.0){
                let photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoVC") as! PhotoViewController
                photoVC.capturedPhoto = capturedImage
                DispatchQueue.main.async {
                    self.present(photoVC, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
