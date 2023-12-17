# DragonAnnouncement

![Static Badge](https://img.shields.io/badge/status-active-brightgreen)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/Drag0ndust/DragonAnnouncement/develop?logo=github)
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/Drag0ndust/DragonAnnouncement/unit_tests.yml)

Welcome to the DragonAnnouncement Swift Package. Use this package to show announcements in your app from a local source in the app or from a remote source from the web.

## Getting started
### [Swift Package Manager](https://www.swift.org/package-manager/)
Add `DragonAnnouncement` to your **Package.swift** dependencies
```swift
dependencies: [
    ...
    .package(url: "https://github.com/Drag0ndust/DragonAnnouncement", from: "1.0.0"),
    ...
]
```

### Usage
The package provides a `ViewModifier` called `.announcement(type:)` which can be added to each SwiftUI View.
```swift
VStack {
    Text("Example App")
}
.announcement(type: .local(announcement: exampleAnnouncement))
```

For a complete example, refer to the [ExampleApp](https://github.com/Drag0ndust/DragonAnnouncement/tree/develop/ExampleApp) directory in the project repository.


## Contribution
- Read the [Code of Conduct](https://github.com/Drag0ndust/DragonAnnouncement/blob/develop/CODE_OF_CONDUCT.md)
- Read the [Contribution Guidelines](https://github.com/Drag0ndust/DragonAnnouncement/blob/develop/CONTRIBUTING.md)
- Create a new issue or work on an existing issue (check if someone is already assigned first).
- Feel free to extend the functionality, but ensure your change benefits all users of this package.

## Support
You can sponsor me on [Github Sponsors](https://github.com/sponsors/drag0ndust) to support my open-source projects.

## Contact

Feel free to reach out if you have questions or if you want to contribute in any way:

- Threads: [@drag0ndust](https://www.threads.net/@drag0ndust)
- Mastodon: [@drag0ndust@iosdev.space](https://iosdev.space/@drag0ndust)
- E-Mail: [thimo.bess@gmail.com](mailto:thimo.bess+opensource@gmail.com)

## License
This project is licensed under [MIT](https://github.com/Drag0ndust/DragonAnnouncement/blob/develop/LICENSE).
