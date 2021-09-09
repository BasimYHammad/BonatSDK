//
//  VCCameraQR.swift
//  sdkProject
//
//  Created by Basim on 8/26/21.
//

import UIKit
import AVFoundation
import Foundation


class VCCameraQR: UIViewController , AVCaptureMetadataOutputObjectsDelegate {
    
    var customerAuth1 : CustomerAuthSDKBonat!
    func startCapture() {
        captureSession = AVCaptureSession()
        guard let videoCaptureDevice_1 = AVCaptureDevice.default(for: .video) else { return }
        videoCaptureDevice = videoCaptureDevice_1
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        let metadataOutput = AVCaptureMetadataOutput()
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417, .qr]
        } else {
            failed()
            return
        }
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.insertSublayer(previewLayer, at: 0)
        
        captureSession.startRunning()
    }
    var isScanning = true
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var videoInput: AVCaptureDeviceInput!
    var videoCaptureDevice : AVCaptureDevice!
    
    
    func failed() {
        let ac = UIAlertController(title:"KeyScanningnotsupported", message: "KeyYourdevicedoesnotsupportscanningacodefromanitem.Pleaseuseadevicewithacamera", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "ok", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if !isScanning {
            return
        }
        captureSession.stopRunning()
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            let newURL = URL(string: stringValue )
            let data64 =   newURL?.valueOf("data")
            let customerID  = self.customerAuth1.data.idCustomer  // get from save data or respnse  //basim  basim mabsi
            if data64 != nil {
                self.updateOrder(idCustomer : customerID.description , data  : data64! , sdKTokenNew : self.customerAuth1.data.sdkToken.description)
            } else {
                self.captureSession.startRunning()
                print ("KeyNorightfoundQRCode")
              
            }
            
        }
    }
     
    @IBAction func buback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        startCapture()
        post_SDKBounatAuthFirst(idMerchant: "1000", secret: "7102273b683c8e7d", phoneNumber: "0512345678", onSuccess: { (dataNew) in
            self.customerAuth1 = dataNew
          
        })

    }
    
    func updateOrder(idCustomer : String , data : String , sdKTokenNew : String) {
        
        APIManagerSDKBonat.shared.updateOrder(idCustomer : idCustomer ,data : data  , sdKTokenNew : sdKTokenNew, onSuccess : {
            (msg) in
            if msg == "done" {
                DispatchQueue.main.async {
                    self.captureSession.stopRunning()
                    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                    AudioServicesPlaySystemSound(SystemSoundID(1057))
                    
                    self.navigationController?.popViewController(animated: true)
                }
            }else {
                print ( "check api url and response form server")
            }
        }, messageReturn: { (msg) in
            print (msg)
        }, onFailure: { (msg) in
            print (msg)
            if msg == "not done" {
                self.captureSession.startRunning()
                
            }else {
                
            }
        })
        
    }
    
}

