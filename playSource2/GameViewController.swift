//
//  GameViewController.swift
//  playSource2
//
//  Created by Hao Dong on 19/02/2017.
//  Copyright © 2017 Hao Dong. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var scnView: SCNView!
    
    
    //Property
    private var scnCamera = SCNCamera()
    private var scene: SCNScene!
    private var photoFrame: SCNGeometry!
    

    @IBAction func ButtonTapped(_ sender: UIButton) {
        //scnView.scene?.rootNode.camera?.colorGrading.contents =
        scnView.scene?.rootNode.childNode(withName: "plane", recursively: true)?.geometry?.firstMaterial?.diffuse.contentsTransform = SCNMatrix4MakeScale(0.5, 1, 1)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        scene = SCNScene(named: "untitled.scn")!
        
        // set the scene to the view
        scnView.scene = scene
        scnView.allowsCameraControl = true
        setUpCamera()
        setUpMeterial()
        
        // configure the view
        scnView.scene?.background.contents = UIImage(named: "interior_hdri_29_20150416_1169368110.jpg")
        scnView.scene?.lightingEnvironment.contents = UIImage(named: "interior_hdri_29_20150416_1169368110.jpg")
        scnView.scene?.lightingEnvironment.intensity = 2.0
        //scnView.scene?.background.contents = UIImage(named: "sphericalBlurred.png")
        
    }
    private func setUpCamera() {
        let cameraNode = SCNNode()
        cameraNode.camera = scnCamera
        cameraNode.position = SCNVector3(8, 100, 230)
        scnCamera.zFar = 1000
        scene.rootNode.addChildNode(cameraNode)
    }
    private func setUpMeterial() {
        photoFrame = scene.rootNode.childNode(withName: "Plane", recursively: true)!.geometry
        for i in 0...2 {
            photoFrame.materials[i].lightingModel = .physicallyBased
            photoFrame.materials[i].metalness.contents = UIImage(named: "gold-scuffed-metal.png")
            photoFrame.materials[i].normal.contents = UIImage(named: "gold-scuffed-normal.png")
            photoFrame.materials[i].roughness.contents = UIImage(named: "gold-scuffed-roughness.png")
        }
    }
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
