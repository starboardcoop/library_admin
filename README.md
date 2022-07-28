# Library Admin

[\[Penpot\]](https://design.penpot.app/#/dashboard/team/9ff3e740-f66e-11ec-a4ab-f940e3befd53/projects)

## Background

Library Admin is a Flutter app designed for operating a tool-lending library. Development is currently focused on the needs of [PVD Things](https://www.pvdthings.coop), a new tool-lending library in Providence, Rhode Island.

## Getting Started

First, make sure you have [Flutter 3](https://docs.flutter.dev/get-started/install) installed.

Then clone the repo.
```
git clone https://github.com/starboardcoop/library_admin.git
```

From the project directory in your terminal app, install all dependencies.
```
flutter pub get
```

Run the project. You'll need to get the appropriate key, ID, and table name for the database hosted by Airtable.
```
flutter run --dart-define=AIRTABLE_API_KEY=<KEY> --dart-define=AIRTABLE_BASE=<ID> --dart-define=AIRTABLE_INVENTORY_TABLE=<Name>
```
