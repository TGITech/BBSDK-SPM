//
//  Empty.swift
//
//  Created by Volodymyr Kovtun on 29.08.2024.
//

// BBSDKWrapper only carries the per-platform BBSDK into the BBSDK-SPM product (see Package.swift);
// apps `import BBSDK` themselves. It doesn't import BBSDK, so it doesn't build against BBSDK's
// interface and needs none of the modules that interface imports.
