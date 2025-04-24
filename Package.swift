// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ZBarSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "ZBarSDK",
            targets: ["ZBarSDK"]
        )
    ],
    targets: [
        .target(
            name: "ZBarSDK",
            path: ".", // คง path เดิม
            publicHeadersPath: "include",
            sources: [
                "include/zbar.h",
                "zbar/config.c",
                "zbar/decoder/codabar.c",
                "zbar/decoder/code39.c",
                "zbar/decoder/code93.c",
                "zbar/decoder/code128.c",
                "zbar/decoder/databar.c",
                "zbar/decoder/ean.c",
                "zbar/decoder/i25.c",
                "zbar/decoder/qr_finder.c",
                "zbar/error.c",
                "zbar/image.c",
                "zbar/img_scanner.c",
                "zbar/refcnt.c",
                "zbar/scanner.c",
                "zbar/symbol.c",
                "zbar/qrcode/qrdecoder.c",
                "iphone/ZBarCaptureReader.m",
                "iphone/ZBarReaderController.m",
                "iphone/ZBarReaderView.m",
                "iphone/ZBarReaderViewController.m",
                "iphone/ZBarSymbol.m",
                "iphone/ZBarCameraSimulator.m",
                "iphone/ZBarReaderViewImpl_Capture.m",
                "iphone/ZBarReaderViewImpl_Simulator.m"
            ],
            resources: [
                .copy("iphone/res")
            ],
            cSettings: [
                .define("NDEBUG", to: "1"),
                .unsafeFlags(["-w"])
            ],
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("QuartzCore"),
                .linkedLibrary("iconv")
            ]
        )
    ]
)
