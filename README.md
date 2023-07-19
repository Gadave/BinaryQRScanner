# BinaryQRScanner

BinaryQRScanner is a SwiftUI framework that allows you to scan QR codes. The purpose of the framework was the idea of working with binary data. You can encode, compress and put information into a QR Code yourself. BinaryQRScanner allows you to scan such QR codes and get binary data that you can work with, you can also use BinaryQRScanner to work with String type data. 

## Installation with Swift Package Manager

Simply import the project using the link:
```
https://github.com/Gadave/BinaryQRScanner
```

<img src="" width="500">

## Usage

Write Import statement on your source file
```swift
import BinaryQRScanner
```

**Important:** iOS *requires* you to add the "Privacy - Camera Usage Description" key to your Info.plist file, providing a reason for why you want to access the camera.

<img src="" width="500">


## Examples

Below is an example of how you can use the QR scanner:

```swift
struct BinaryQRScannerSampleView: View {
    @State var isQRScannerPresented = false
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    isQRScannerPresented.toggle()
                } label: {
                    Text("Open QRScanner")
                }
            }
        }
        .sheet(isPresented: $isQRScannerPresented) {
            // You can add any UIView and place it on top of the QRScanner view, such as a picture or text for the application user.
            let messageForUser = "Point the camera at the QR code."
            let messageView = UILabel()
            let messagePosition = BinaryQRScanner.View.SubviewPosition.top
            let indent: CGFloat = 20
            BinaryQRScanner.View(
                mode: .binary,
                completion: handleScan,
                dismiss: dismissQRScanner,
                subview: (messageView, messagePosition, indent)
            )
        }
    }
    
    private func handleScan(
        result: Result<BinaryQRScanner.ScanResult, BinaryQRScanner.ScanError>,
        dismissScanner: () -> Void,
        continueScanning: () -> Void
    ) {
        if case .success(let result) = result {
            if case .text(_) = result {
                print(result)
            } else if case .binary(let data) = result {
                // Provide your code for processing binary data
            }
        } else if case .failure(let error) = result {
            print(error)
        }
    }
    
    private func dismissQRScanner() {
        // You can place additional code in this method that must be executed before QRScanner closes
        isQRScannerPresented = false
    }
}
```


## Contributing to the project

If you would like to contribute to the BinaryQRScanner project, you can follow the steps below:

Clone the repository:
```bash
git clone https://github.com/Gadave/BinaryQRScanner.git
```

Make the necessary changes.

Create a Pull Request describing your changes and their benefits.

## Committers

Georgii Davydenko (@gadave)
