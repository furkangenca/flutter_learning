# Flutter Counter App Using Bloc

While learning Flutter, I previously built a counter app using a `StatefulWidget`. This time, I’m creating a counter app using the Bloc pattern to manage state.


## Project Setup

After creating the project, I set up the necessary files:

### Event and State Files

In Bloc architecture, it's common to use abstract classes. These provide a base structure that can't be instantiated and ensure that derived classes must implement their methods. In this project, the Event and State classes follow this pattern.

**Why abstract?** It allows for a more organized and scalable structure. The abstract classes only define the properties and methods, while the derived classes handle the specifics. The two key concepts in Bloc are abstract classes and inheritance.

### Bloc File Structure

In the Bloc file, we utilize a feature from the Bloc package to connect the state and event classes:

```dart
CounterBloc() extends Bloc<CounterEvent, CounterState> {}
```

This allows us to manage both the state and event within the Bloc. We’ll also frequently use the `super()` method to call constructors from the parent class.

Some important Bloc methods include:

- `on<>():` This method handles the events we define in our Event class and provides a structure for specifying what happens when the event occurs.

```dart
on<IncrementEvent>((event, emit) => ...)
```

In this method:
- `<IncrementEvent>` is the type of event we are handling.
- `emit` is used to update the current state in the Bloc.

### Defining Events

The events define the user actions — in this case, incrementing and decrementing the counter. The main event is `CounterEvent`. Subclasses for incrementing and decrementing inherit from this base event class.

```dart
class IncrementEvent extends CounterEvent {}
class DecrementEvent extends CounterEvent {}
```

### Defining States

In the State file, we define the `CounterState`, which holds the counter value. Similar to events, we define the abstract class `CounterState` and a subclass to manage the counter's value.

```dart
abstract class CounterState {}
class CounterValueState extends CounterState {
  final int count;
  CounterValueState(this.count);
}
```

### Managing Events and State in Bloc

The `CounterBloc` file ties everything together:
- Both the Event and State classes are referenced.
- We handle events using the `on<>` method and update the state with `emit`.

### Integrating Bloc into the UI

We’ll use a `BlocProvider` to wrap the widget tree so that Bloc is accessible throughout the app.

```dart
BlocProvider(
  create: (_) => CounterBloc(),
  child: CounterPage(),
)
```

This makes the `CounterBloc` available within the widget tree, allowing us to use Bloc with context:

```dart
final counterBloc = context.read<CounterBloc>();
```

To update the UI based on state changes, we wrap the UI components in `BlocBuilder`:

```dart
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) {
    return Text(state.count.toString());
  },
)
```

This listens for state changes and updates the UI accordingly.

### Handling User Input with Events

To trigger events like incrementing or decrementing the counter, we define buttons with an `onPressed` callback:

```dart
onPressed: () => counterBloc.add(IncrementEvent()),
```

Unlike other state management solutions like GetX, Bloc requires the `.add()` method to queue the event for processing. This ensures that the event is handled asynchronously.

### Key Differences from GetX

- In GetX, we can call methods directly, such as `controller.IncreaseCounter()`.
- In Bloc, we need to use `.add()` to add events to the queue for processing. This is because Bloc handles events asynchronously, unlike the direct method calls in GetX.

![Screenshot_11](https://github.com/user-attachments/assets/1131fb06-3bfe-4c60-879e-824583b57d57)
