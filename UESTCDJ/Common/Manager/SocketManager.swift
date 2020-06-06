//
//  SocketManager.swift
//  UESTCDJ
//
//  Created by JLM on 2020/5/10.
//  Copyright © 2020 ccw. All rights reserved.
//

import Foundation

class SocketManager {
    
    private var listenSocket: GCDAsyncSocket!
    private var connectSocket: GCDAsyncSocket!
    private let port: UInt16 = 2345
    
    private var buffer = NSMutableData()
    
    
    static let shared = SocketManager()
    
    private init() {
        
    }
    
    func initialSocket() {
        listenSocket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue(label: "socketQueue"))
//        let error: NSError? = nil
        do {
            try? listenSocket.accept(onPort: port)
        } catch {
            print("连接出问题了")
        }
    }
}

extension SocketManager: GCDAsyncSocketDelegate {
    func socket(_ sock: GCDAsyncSocket!, didRead data: Data!, withTag tag: Int) {
        print("收到消息")
        connectSocket.readData(withTimeout: -1, tag: 0)
        TransObjc.shareTool().tran(data, buffer)
    }
    
    func socket(_ sock: GCDAsyncSocket!, didConnectToHost host: String!, port: UInt16) {
        print("didConnectToHost")
    }
    
    func socket(_ sock: GCDAsyncSocket!, didAcceptNewSocket newSocket: GCDAsyncSocket!) {
        print("didAcceptNewSocket")
        connectSocket = newSocket;
        newSocket.readData(withTimeout: -1, tag: 0)
    }
    
    
}


