# ocaml-cordova-plugin-camera

* gen_js_api (master branch): [![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-camera.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-camera)

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

## How to install and compile your project by using this plugin ?

Don't forget to switch to a compiler **>= 4.03.0**.
```Shell
opam switch 4.03.0+beta1
```

You can use opam by pinning the repository with
```Shell
opam pin add cordova-plugin-camera https://github.com/dannywillems/ocaml-cordova-plugin-camera.git
```

and to compile your project, use
```Shell
ocamlfind ocamlc -c -o [output_file] -package gen_js_api -package cordova-plugin-camera [...] -linkpkg [other arguments]
```

Don't forget to install the cordova plugin camera with
```Shell
cordova plugin add cordova-plugin-camera
```

## How to use ?

See the official documentation
[cordova-plugin-camera](https://github.com/apache/cordova-plugin-camera)

## ! BE CAREFUL !

The plugin creates a new object called *navigator.camera*, but the object is
available when the *deviceready* event is handled.

We provide a function *Camera.t* of type *unit -> camera* which creates the
binding to the *navigator.camera* object. You must call it when the deviceready
event is handled, eg (with js_of_ocaml)

```OCaml
let on_device_ready _ =
  let camera = Camera.t () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
