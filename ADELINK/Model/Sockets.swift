import UIKit

class Sockets: NSObject {
    //1
    var inputStream: InputStream!
    var outputStream: OutputStream!
        
    let maxReadLength = 4096
    
    func setupNetworkCommunication(IP: String) {
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,
                                         IP as CFString,
                                         1234,
                                         &readStream,
                                         &writeStream)
        inputStream = readStream!.takeRetainedValue()
        outputStream = writeStream!.takeRetainedValue()
            
        inputStream.schedule(in: .current, forMode: .common)
        outputStream.schedule(in: .current, forMode: .common)
      
        inputStream.open()
        outputStream.open()
    }
    
    func send(message: String) {
      //let data = "msg:\(message)".data(using: .utf8)!
      let data = "\(message)".data(using: .utf8)!
      
      _ = data.withUnsafeBytes {
        guard let pointer = $0.baseAddress?.assumingMemoryBound(to: UInt8.self) else {
          print("Error joining chat")
          return
        }
        outputStream.write(pointer, maxLength: data.count)
      }
    }
    
    func stopChatSession() {
      inputStream.close()
      outputStream.close()
    }
}
