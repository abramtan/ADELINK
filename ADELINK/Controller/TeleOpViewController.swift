import UIKit

class TeleOpViewController: UIViewController, UITextFieldDelegate {
    
    let sockets = Sockets()
    
    var ip = ""
    var toVar = "T"
    var downVar = "D"
    var forwardVar = "F"
    var upVar = "U"
    var leftVar = "L"
    var backVar = "B"
    var rightVar = "R"
    
    @IBOutlet weak var ipAddress: UITextField!
    
    @IBOutlet weak var toButton: UIButton!
    
    @IBOutlet weak var downButton: UIButton!
    
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var upButton: UIButton!
    
    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ipAddress.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
//      sockets.delegate = self
//      sockets.setupNetworkCommunication(IP: ip)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
//        if (ip == "") {
//            return
//        }
//        else {
//            sockets.stopChatSession()
//        }
    }
    
    @IBAction func forwardButton(_ sender: UIButton) {
        if (ip == "") {
            return
        }
        else {
            sockets.send(message: forwardVar)
        }
    }

    @IBAction func upButton(_ sender: UIButton) {
        if (ip == "") {
            return
        }
        else {
            sockets.send(message: upVar)
        }
    }

    @IBAction func backwardButton(_ sender: UIButton) {
        if (ip == "") {
            return
        }
        else {
            sockets.send(message: backVar)
        }
    }

    @IBAction func downButton(_ sender: UIButton) {
        if (ip == "") {
            return
        }
        else {
            sockets.send(message: downVar)
        }
    }
    
    @IBAction func leftButton(_ sender: UIButton) {
        if (ip == "") {
            return
        }
        else {
            sockets.send(message: leftVar)
        }
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        if (ip == "") {
            return
        }
        else {
            sockets.send(message: rightVar)
        }
    }
    
    @IBAction func toButton(_ sender: UIButton) {
        if (toVar == "T") {
            toVar = "O"
            toButton.setTitle("Orientation", for: .normal)
            print(toVar)
            downButton.setTitle("YCW", for: .normal)
            forwardButton.setTitle("PCW", for: .normal)
            upButton.setTitle("RCW", for: .normal)
            leftButton.setTitle("YCCW", for: .normal)
            backButton.setTitle("PCCW", for: .normal)
            rightButton.setTitle("RCCW", for: .normal)
            downVar = "YCW"
            forwardVar = "PCW"
            upVar = "RCW"
            leftVar = "YCCW"
            backVar = "PCCW"
            rightVar = "RCCW"
        }
        else {
            toVar = "T"
            toButton.setTitle("Translation", for: .normal)
            print(toVar)
            downButton.setTitle("D", for: .normal)
            forwardButton.setTitle("F", for: .normal)
            upButton.setTitle("U", for: .normal)
            leftButton.setTitle("L", for: .normal)
            backButton.setTitle("B", for: .normal)
            rightButton.setTitle("R", for: .normal)
            downVar = "D"
            forwardVar = "F"
            upVar = "U"
            leftVar = "L"
            backVar = "B"
            rightVar = "R"
        }
        
        if (ip == "") {
            return
        }
        else {
            sockets.send(message: toVar)
        }
    }
    
    @IBAction func connectButton(_ sender: UIButton) {
        if (ip == "") {
            return
        }
        else {
            ip = ipAddress.text!
            sockets.setupNetworkCommunication(IP: ip)
        }
    }

    @IBAction func disconnectButton(_ sender: UIButton) {
        if (ip == "") {
            return
        }
        else {
            sockets.stopChatSession()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(ipAddress.text!)
        ip = ipAddress.text!
        ipAddress.endEditing(true)
        return true
    }
}
