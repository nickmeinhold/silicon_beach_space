# silicon_beach_space

A Flutter app to assist co-working spaces to check in Silicon Beach members.

## Redux RemoteDevTools (RDT) 

- find the IP address of the computer 
- use one of the strings in `utilities/mock.dart` or make a new one 
- edit `main.dart` to use the correct IP 
- run the remotedev server

```
remotedev --port 8000
```

- open a web page with url:

```
http://localhost:8000/
```

## Code gen with built_value 

After making changes to built_value classes run the builder to generate the new code:

```
flutter pub run build_runner build
```

## Tests 

### Unit and Widget Tests 

```
flutter test
```

### Integration Tests 

In VSCode set the device to an emulator then run: 

```
flutter drive --target=test_driver/app.dart
```
