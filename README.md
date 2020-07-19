![Swiita Icon](banner.png)

# Overview

[![latest release](https://img.shields.io/github/v/release/Enchan1207/Swiita?sort=semver)](https://github.com/Enchan1207/Swiita/releases)
![travis CI](https://img.shields.io/travis/Enchan1207/Swiita)
![licence](https://img.shields.io/github/license/Enchan1207/Swiita)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Enchan1207/Swiita)  

Simple iOS Framework for Qiita API written in Swift.  

## Installation

Currently, Swiita only supports installation via Carthage.   
For installing, please add it to `Cartfile` of your project.  
`github "Enchan1207/Swiita"`  

## Usage

### Application regist

First, go [Register the application - Qiita](https://qiita.com/settings/applications/new) to regist your Application.  
In "Callback URL", set the custom URL scheme for launching your application.(e.g. *swiita-testapplication*)  

(If you aren't set custom URL scheme yet on your project, add it in `Info.plist`)  
![additional info.plist](https://user-images.githubusercontent.com/51850597/87874107-294ed900-ca02-11ea-8cce-f9af1ecd0e07.png)  

### Account authentication

To authenticate account, you need to add it in `SceneDelegate.swift`:  

```swift
func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    Swiita.handleCallback(URLContexts: URLContexts, callBack: URL(string: "{Callback URL}")!)
}
```

Then add this to the part that performs the authenticate function.  

```swift
swiita.authorize(presentViewController: self, authority: [.read], success: { (token) in
    // access token
    print(token)
}) { (error) in
    // Error handling
}
```

In "authority", you can set access tokens authority.  
It only accepts value of type `QiitaAPIAuthority`.  
([SwiitaAuthority.swift](https://github.com/Enchan1207/Swiita/blob/master/Swiita/enums%2C%20Structs/SwiitaAuthority.swift) for details.)  

### Instance initialization

To initialize instance, you need those params.

 * clientid: Qiita APIs application client ID.  
 * clientsecret: Qiita APIs application client secret key.  
 * token(Optional): Access token(if you generated beforehand, you can set it.)

```swift
/// Generate Instance.
/// - Parameters:
///     - clientid: Qiita API client ID
///     - clientsecret: Qiita API client secret
///     - apihost: Qiita API hostname
///     - token: Access token string
Swiita(clientid: "{client id}", clientsecret: "{client secret}", apihost: "{api host}", token: "{access token}")
```

**NOTE: about parameter `apihost`:**
Using Qiita API as general user,  you don't have to set it.
But if you use it as Qiita Team,  you need set this parameter to `{team name}.qiita.com`.

### API Request / Response

Being finished api requests without any errors, the callback function `success(HTTPStatusType, JSONObject)` will be performed.  
"HTTPStatusType" is enum which has response type of API request(e.g. *Successful*).  
"JSONObject" is parsed JSON object from API response.

### Pagination

Some Qiita API accepts parameter "page" and "per_page".  
and those responses header has `Total-Count`, but currently version can't check this value.  

## About Qiita Team

Now, this framework doesn't support "Qiita Team"s APIs.  
(Not belonging any qiita team, so I can't implement and debug those.)
