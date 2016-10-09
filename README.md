# Seismi
Seismi is an iOS application written using Objective-C that can be used to view publicly available earthquake data using [SeismiKit](https://github.com/sangeetavishwanath/SeismiKit).

## Installation using Cocopods
[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C. You can install it with the following command:

```bash
$ gem install cocoapods
```

#### Project Setup

Clone the [Seismi](https://github.com/sangeetavishwanath/Seismi) repository, then run the following command. You are good to go!

```bash
$ pod install
```

## Architectural Notes

#### Model-View-Presenter Design Pattern
The Seismi application is implemented using the Model-View-Presenter design pattern. 

![MVP](/Sketchboard/MVP.png?raw=true "MVP")

In this design pattern, each `UIViewController` has a dedicated `Presenter`. The `Persenter` is notified of any UI events. The presenter encapsulates the presentation logic for it's `UIViewController`. Any UI updates are made by delegation via the `<ViewSurface` protocol.

For example, our `EarthquakesViewController` has an `EarthquakesPresenter`. When the viewDidLoad method of the `EarthquakesViewController` is called, it notifies the `EarthquakesPresenter` with the method `earthquakesViewDidLoad`.

The `EarthquakesPresenter` immediately asks the `<EarthquakesViewSurface>` to show a loading state and interacts with the SeismiKit to fetch earthquakes data. When the data has been fetched, the `EarthquakesPresenter` asks the `<EarthquakesViewSurface>` to stop showing a loading state and notifies it that the earthquakes data has been fetched.

In the author's interpretation of Model-View-Presenter, the `EarthquakesViewController` depends on its presenter for UITableView delegation and datasource as well. When the table view reloads, it asks the presenter for information such as `numberOfSectionsInEarthquakeTable`, `numberOfRowsInSection:`, etc.

## Improvements

##### Improvements: Security
[Seismi](seismi.org) does not use TLS 1.2 and we are forced to disable App Transport Security to be able to use this API. Were this an internal API, the author recommends upgrading to TLS 1.2.

#### Improvements: Testing
Implement Xcode UI testing for the Seismi iOS app.

#### Improvements in UI design
The Seismi iOS app represents the earthquakes data in a UITableView. The color of the cell is representative of the severity of the earthquake. We can make the following improvements to the UI design:

* Pagination
* Searching, sorting and filtering on the earthquake data
* An alternative map view which loads relevant earthquake data on the map view as the customer navigates to various regions of the world.

#### Build Automation
* Build scripts - Fastlane 
* Test reports - Slather
* Continuous Integration - Jenkins / BuildKite

## Resources
1. [Presentation Models](http://martinfowler.com/eaaDev/PresentationModel.html)
2. [Passive View](http://martinfowler.com/eaaDev/PassiveScreen.html)
3. [MVP on Android](https://code.tutsplus.com/tutorials/an-introduction-to-model-view-presenter-on-android--cms-26162)