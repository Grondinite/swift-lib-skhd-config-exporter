// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "swift-skhd-config-exporter",
    products: [
        .library(
            name: "LibSkhdConfigExporter",
            targets: ["LibSkhdConfigExporter"]),
    ],
    dependencies: [],
    targets: [

        .systemLibrary(
            name: "CJsonC",
            pkgConfig: "json-c",
            providers: [
                .brew(["json-c"]),
                .apt(["libjson-c-dev"])
            ]
        ),
        
        .target(
            name: "CLibSkhdConfigExporter",
            dependencies: [
                "CJsonC"
            ]
        ),
        
        .target(
            name: "LibSkhdConfigExporter",
            dependencies: ["CLibSkhdConfigExporter"]
        ),
    ]
)
