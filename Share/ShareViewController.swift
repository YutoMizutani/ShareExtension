//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Yuto Mizutani on 2020/01/20.
//

import UIKit
import MobileCoreServices
import Social

class ShareViewController: SLComposeServiceViewController {
    private let bundleID = Bundle.main.bundleIdentifier
    private var appGroupsID: String {
        "group.\(bundleID!.split(separator: ".").map { String($0) }.dropLast().joined(separator: "."))"
    }
    private let userDefaultsKey: String = "public.url"

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
        guard
            let extensionItem: NSExtensionItem = extensionContext?.inputItems.first as? NSExtensionItem,
            let itemProvider = extensionItem.attachments?.first
        else { return }

        let puclicURL = String(kUTTypeURL)

        if itemProvider.hasItemConformingToTypeIdentifier(puclicURL) {
            itemProvider.loadItem(
                forTypeIdentifier: puclicURL,
                options: nil,
                completionHandler: { item, _ in
                    if let url: String = (item as? NSURL)?.absoluteString {
                        print(self.appGroupsID, url)
                        UserDefaults(suiteName: self.appGroupsID)?
                        .set(url, forKey: self.userDefaultsKey)
                    }
                    self.extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
                }
            )
        }
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
}
