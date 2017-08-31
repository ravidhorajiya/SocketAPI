//
//  ViewController.swift
//  SocketAPI
//
//  Created by wos on 26/08/17.
//  Copyright © 2017 Ravi. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {
    
    let socket = SocketIOClient(socketURL: URL(string: "http://localhost:8080")!, config: [.log(true), .compress])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }
        /*
        socket.on("global") {data, ack in
            if let cur = data[0] as? Double {
                self.socket.emitWithAck("canUpdate", cur).timingOut(after: 0) {data in
                    self.socket.emit("update", ["amount": cur + 2.50])
                }
                
                ack.with("Got your currentAmount", "dude")
            }
        }
        */
        
        socket.on("trades") { (dataForTrades, ack) in
            print(dataForTrades)
        }
        
        socket.connect()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

