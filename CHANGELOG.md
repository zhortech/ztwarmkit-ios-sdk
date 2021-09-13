# Changelog

## [v1.0.1](https://github.com/zhortech/ztwarmkit-ios-sdk/-/tags/1.0.1) (2021-09-13)

- `readGeneralState()` was changed to `readGeneralState(completion:)` with completion handler

## [v1.0.0](https://github.com/zhortech/ztwarmkit-ios-sdk/-/tags/1.0.0) (2021-07-28)

***New methods added:***
- `startHeat(temperature:completion:)` - send heating target temperature and enable heating
- `stopHeat(completion:)` - disable heating
- `startHeatTimer(seconds:enable:completion:)` - set the heating timer value and enable/disable timer
- `getTemperature(completion:)` - get the target temperature set value
- `getTimer(completion:)` - get the heating timer set value in seconds
- `isHeating(completion:)` - indicates if insoles are heating currently
