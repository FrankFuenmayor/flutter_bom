# About

This is a sample project for a proposal described in the article. ["Bill of Materials for Flutter: Manage common dependencies in projects with multiple packages"](https://medium.com/@frank.fuenmayor/bill-of-materials-for-flutter-manage-common-dependencies-in-projects-with-multiple-packages-0a2225a2bfa4)


- In the `main` branch, the project contains multiple packages with dependencies and versions described in each one.

- In the `using_bom` branch, the project has a `_bom` package that describes all third-party dependencies and their versions.


### Install dependencies

at the root of the project run:

```shell
flutter pub get
```

to execute a `flutter pub get` in all packages run

```shell
melos bootstrap
```
