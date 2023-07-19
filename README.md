# BinaryQRScanner (iOS 13 +)

BinaryQRScanner is a SwiftUI framework that allows you to scan QR codes. The purpose of the framework was the idea of working with binary data. You can encode, compress and put information into a QR Code yourself. With BinaryQRScanner, you can easily scan such QR codes and retrieve the binary data for further processing. It also supports working with String type data.

## Installation with Swift Package Manager

To integrate BinaryQRScanner into your project, follow these steps:

Open your project in Xcode.
Go to File > Swift Packages > Add Package Dependency.
Enter the repository URL: 
```
https://github.com/Gadave/BinaryQRScanner
```
Follow the prompts to complete the integration.

<img src="https://github.com/Gadave/BinaryQRScanner/blob/main/images/img1.png" width="500">

## Usage

Import the BinaryQRScanner module into your source file:
```swift
import BinaryQRScanner
```

**Important:** 
Important: In order to access the camera, iOS requires you to add the "Privacy - Camera Usage Description" key to your Info.plist file. Provide a reason for why your app needs access to the camera by adding the following entry:

Key: Privacy - Camera Usage Description
Value: "We need camera access to scan QR codes."

<img src="https://github.com/Gadave/BinaryQRScanner/blob/main/images/img2.png" width="500">


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
