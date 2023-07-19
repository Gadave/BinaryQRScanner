import SwiftUI

public enum BinaryQRScanner {
    public enum ScanResult {
        case text(_ text: String)
        case binary(_ data: Data)
    }

    public enum ScanError: Error {
        case avCaptureError(error: Error? = nil)
        case permissionDenied
        case incorrectEncodingMode
    }

    public enum EncodingMode {
        case text
        case binary
    }

    public struct View: UIViewControllerRepresentable {
        public enum SubviewPosition {
            case center
            case top
            case bottom
            case leading
            case trailing
        }

        public typealias ScanCompletionHandler = (
            _ result: (Result<ScanResult, ScanError>),
            _ dismissScanner: @escaping () -> Void,
            _ continueScanning: @escaping () -> Void
        ) -> Void
        
        public typealias SubviewWithPosition = (
            view: UIView,
            positiotion: SubviewPosition,
            indent: CGFloat
        )

        public var mode: EncodingMode
        public var completion: ScanCompletionHandler
        public var dismiss: () -> Void
        public var subview: SubviewWithPosition?

        public init(
            mode: EncodingMode,
            completion: @escaping ScanCompletionHandler,
            dismiss: @escaping () -> Void,
            subview: SubviewWithPosition?
        ) {
            self.mode = mode
            self.completion = completion
            self.dismiss = dismiss
            self.subview = subview
        }

        public func makeUIViewController(context: Context) -> Controller {
            Controller(parentView: self)
        }

        public func updateUIViewController(_ uiViewController: Controller, context: Context) {
            uiViewController.parentView = self
        }
    }
}
