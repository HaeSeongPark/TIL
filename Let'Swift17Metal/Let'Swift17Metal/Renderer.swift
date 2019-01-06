//
//  Renderer.swift
//  Let'Swift17Metal
//
//  Created by rhino Q on 06/01/2019.
//  Copyright © 2019 rhino Q. All rights reserved.

import Foundation

// What is all of these?
// What is deffrence Metal, MetalKit, MetalPerformanceShaders?
//import MetalPerformanceShaders
import MetalKit

// The object that implement MTKViewDelegate sholud subclass NSObjet
//NSObject is top class of all classes in objc lang
// Why?

// trouble shooting
// if you want to use type CAMetalDrawable, you should select 'Generic iOS Device' or your real Device instedad of an simulator in the active scheme

class Renderer: NSObject, MTKViewDelegate {
    var mtkView: MTKView!
    
    let device: MTLDevice
    let queue: MTLCommandQueue
    let cps: MTLComputePipelineState
    var textture: MTLTexture
    
    init?(mtkView: MTKView) {
        
        // 1. Metal View
        self.mtkView = mtkView
        self.mtkView.framebufferOnly = false
        
        // 2. MTLDevice direct connection to the GPU
        self.device = MTLCreateSystemDefaultDevice()! // force unwrapped
        
        // 3. ordered list of commands that you ask the GPU to execture once a time
        self.queue = self.device.makeCommandQueue()!  // force unwrapped
        
        // 4. for shader
        let library = self.device.makeDefaultLibrary()!
        let kernal = library.makeFunction(name: "compute")!
        self.cps = try! self.device.makeComputePipelineState(function: kernal)
        
        // load texture for post image processing
        // Think of texture as image that used in Metal.
        let textureLoader = MTKTextureLoader(device: self.device)
        let path = Bundle.main.path(forResource: "background", ofType: "jpg")
        self.textture = try! textureLoader.newTexture(
            URL: URL(fileURLWithPath: path!),
            options: [MTKTextureLoader.Option.SRGB : false as NSObject])
        //        [MTKTextureLoader.Origin.BottomLeft:true as NSObject]) ?
        super.init()
        
        self.mtkView.delegate = self
        self.mtkView.device = device
    }
    
    //MARK:  MTKViewDelegate
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    func draw(in view: MTKView) {
        if let drawable = self.mtkView.currentDrawable {
            
            // 렌더링을 할 명령에 대한 데이터를 담는 객체?
            let commandBuffer = queue.makeCommandBuffer()!
            
            // 다양한 종료의 명령을 커맨드버터에 담을 수 있도록 인코딩해주는 객체?
            let commandEncoder = commandBuffer.makeComputeCommandEncoder()!
            
            // 쉐이더를 사용하기위해 파이프라인을 인코더에 추가
            commandEncoder.setComputePipelineState(cps)
            
            // texture 정의
            // 0 : 아우풋
            // 1 : 후처리할 이미지
            commandEncoder.setTexture(drawable.texture, index: 0)
            commandEncoder.setTexture(self.textture, index: 1)
            
            // gpu는 쉐이더를 여러 스레드로 처리?
            let threadGroupCount = MTLSizeMake(8, 8, 1)
            let threadGropus = MTLSizeMake(drawable.texture.width / threadGroupCount.width,
                                           drawable.texture.height / threadGroupCount.height, 1)
            
            commandEncoder.dispatchThreadgroups(threadGropus, threadsPerThreadgroup: threadGroupCount)
            commandEncoder.endEncoding()
            commandBuffer.present(drawable)
            commandBuffer.commit()
        }
    }
}
