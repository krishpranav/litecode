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
    
    func startMonitoring() {
        guard folderMonitorSource == nil && monitoredFolderFileDescriptor == -1 else {
            return
        }
        
        monitoredFolderFileDescriptor = open(url.path, O_EVTONLY)
        
        guard monitoredFolderFileDescriptor != -1 else { return }
        
        folderMonitorSource = DispatchSource.makeFileSystemObjectSource(fileDescriptor: monitoredFolderFileDescriptor, eventMask: .write, queue: folderMonitorQueue)
        
        folderMonitorSource?.setEventHandler { [weak self] in
            guard let strongSelf = self else { return }
            guard
                let attributes = try? FileManager.default.attributesOfItem(atPath: strongSelf.url.path)
            else { return }
            if let lastModified = attributes[.modificationDate] as? Date {
                strongSelf.folderDidChange?(lastModified)
            }
        }
        
        folderMonitorSource?.setCancelHandler { [weak self] in
            guard let strongSelf = self else { return }
            close(strongSelf.monitoredFolderFileDescriptor)
            strongSelf.monitoredFolderFileDescriptor = -1
            strongSelf.folderMonitorSource = nil
        }
        
        folderMonitorSource?.resume()
    }
    
    func stopMonitoring() {
        folderMonitorSource?.cancel()
    }
}
