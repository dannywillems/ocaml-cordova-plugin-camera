# ocaml-cordova-plugin-camera

Binding to
[cordova-plugin-camera](https://github.com/apache/cordova-plugin-camera)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-camera-example).

## What does cordova-plugin-camera do ?

```
This plugin defines a global navigator.camera object, which provides an API for
taking pictures and for choosing images from the system's image library.
```

Source: [cordova-plugin-camera](https://github.com/apache/cordova-plugin-camera)

## Repository branches and tags

We are migrating bindings from
[js_of_ocaml](https://github.com/ocsigen/js_of_ocaml) (low level bindings) to
[gen_js_api](https://github.com/lexifi/gen_js_api) (high level bindings).

The gen_js_api binding allows to use *pure* ocaml types (you don't have to use
the ## syntax from js_of_ocaml or Js.string type but only # and string type).

The js_of_ocaml version is available in the branch
[*js_of_ocaml*](https://github.com/dannywillems/ocaml-cordova-plugin-camera/tree/js_of_ocaml)
but we **recommend** to use the gen_js_api version which is the master branch.

## How to use ?

TODO

## ! BE CAREFUL !

The plugin creates a new object called *navigator.camera*, but the object is
available when the *deviceready* event is handled.

We don't provide a *navigator.camera* variable in this plugin (as said in the official
documentation on js_of_ocaml). If we did, *navigator.camera* will be set to **undefined**
because the *navigator.camera* object doesn't exist when we create the variable.

Instead, we provide a function *camera* of type *unit -> camera Js.t* which creates the
binding to the *navigator.camera* object. You must call it when the deviceready
event is handled, eg

```OCaml
let on_device_ready =
  let camera = Camera.camera () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
