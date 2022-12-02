//
//  ViewController.swift
//  ZendeskSupportDemo
//
//  Created by Timur Dyushaliev on 2/12/22.
//

import UIKit
import SupportSDK
import ZendeskCoreSDK

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Zendesk.initialize(appId: "516cb27ad6787d28b749e4509a2d400264902bb7b66f9263", clientId: "mobile_sdk_client_ca96b2e725d27c6cc9ec", zendeskUrl: "https://demo4284.zendesk.com")
        Support.initialize(withZendesk: Zendesk.instance)
        Zendesk.instance?.setIdentity(Identity.createAnonymous())
    }
    
    @IBAction func Button(_ sender: Any) {
        openZendeskSupport()
    }
    
    private func openZendeskSupport() {
        let fileName = "test.txt"
        let data = Data("Content of the file".utf8)
        
        let config = RequestUiConfiguration()
        config.fileAttachments = [RequestAttachment(filename: fileName, data: data, fileType: FileType.binary)]
        
        let helpCenter = HelpCenterUi.buildHelpCenterOverviewUi(withConfigs: [config])
        self.navigationController?.pushViewController(helpCenter, animated: true)
    }
}
