//
//  DirectoryFolderMonitor.swift
//  litecode
//
//  Created by Krisna Pranav on 26/04/24.
//

import Foundation

class DirectoryMonitor {
    private var monitors: [String: FolderMonitor] = [:]
    
    private var numberOfFilesMonitored: Int {
        monitors.count
    }
    
    var keys: Dictionary<String, FolderMonitor>.Keys {
        monitors.keys
    }
}

class FolderMonitor {
    private var monitoredFolderFileDescriptor: CInt = -1
    
    private let folderMonitorQueue = DispatchQueue(label: "FolderMonitorQueue", attributes: .concurrent)
    
    private var folderMonitorSource: DispatchSourceFileSystemObject?
    
    var url: Foundation.URL
    
    var folderDidChange: ((Date) -> Void)?
    
    init(url: Foundation.URL) {
        self.url = url
    }
    
    deinit {
        self.stopMonitoring()
    }
    
    func stopMonitoring() {}
}
