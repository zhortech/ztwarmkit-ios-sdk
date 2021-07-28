# Changelog

## [v1.0.0](https://gitlab.com/zhor-tech/sdk/ios/ztwarmkit/-/tags/v.1.0.0) (2021-07-28)

***New methods added:***
- `startHeat(temperature:completion:)` - send heating target temperature and enable heating
- `stopHeat(completion:)` - disable heating
- `startHeatTimer(seconds:enable:completion:)` - set the heating timer value and enable/disable timer
- `getTemperature(completion:)` - get the target temperature set value
- `getTimer(completion:)` - get the heating timer set value in seconds
- `isHeating(completion:)` - indicates if insoles are heating currently
