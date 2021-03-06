(* -------------------------------------------------------------------------- *)
(* OCaml types for the options object *)
(* See the official documentation to know what does it means *)
type destination_type =
  | Data_url [@js 0]
  | File_uri [@js 1]
  | Native_uri [@js 2]
  [@@js.enum]

[@@@js.stop]
val data_url : destination_type
val file_uri : destination_type
val native_uri : destination_type
[@@@js.start]

[@@@js.implem
let data_url          = Data_url
let file_uri          = File_uri
let native_uri        = Native_uri
]
(* ------------------------- *)

(* ------------------------- *)
type encoding_type =
  | Jpeg  [@js 0]
  | Png   [@js 1]
  [@@js.enum]

[@@@js.stop]
val jpeg  : encoding_type
val png   : encoding_type
[@@@js.start]

[@@@js.implem
let jpeg  = Jpeg
let png   = Png
]
(* ------------------------- *)

(* ------------------------- *)
type media_type =
  | Picture   [@js 0]
  | Video     [@js 1]
  | Allmedia  [@js 2]
  [@@js.enum]

[@@@js.stop]
val picture   : media_type
val video     : media_type
val allmedia  : media_type
[@@@js.start]

[@@@js.implem
let picture   = Picture
let video     = Video
let allmedia  = Allmedia
]
(* ------------------------- *)

(* ------------------------- *)
type picture_source_type =
  | Photolibrary      [@js 0]
  | Camera            [@js 1]
  | Saved_photo_album [@js 2]
  [@@js.enum]

[@@@js.stop]
val photo_library     : picture_source_type
val source_camera     : picture_source_type
val saved_photo_album : picture_source_type
[@@@js.start]

[@@@js.implem
let photo_library     = Photolibrary
let source_camera     = Camera
let saved_photo_album = Saved_photo_album
]
(* ------------------------- *)

(* ------------------------- *)
type pop_over_array_direction =
  | Arrow_up      [@js 1]
  | Arrow_down    [@js 2]
  | Arrow_left    [@js 4]
  | Arrow_right   [@js 8]
  | Arrow_any     [@js 15]
  [@@js.enum]

[@@@js.stop]
val arrow_up    : pop_over_array_direction
val arrow_down  : pop_over_array_direction
val arrow_left  : pop_over_array_direction
val arrow_right : pop_over_array_direction
[@@@js.start]

[@@@js.implem
let arrow_up      = Arrow_up
let arrow_down    = Arrow_down
let arrow_left    = Arrow_left
let arrow_right   = Arrow_right
let arrow_any     = Arrow_any
]
(* ------------------------- *)

(* ------------------------- *)
type direction =
  | Back    [@js 0]
  | Front   [@js 1]
  [@@js.enum]

[@@@js.stop]
val back    : direction
val front   : direction
[@@@js.start]

[@@@js.implem
let back  = Back
let front = Front
]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Interface to the cameraPopoverOptions object *)
type camera_pop_over_options = private Ojs.t

val create_camera_pop_over_options :
  ?x:int                                                        ->
  ?y:int                                                        ->
  ?width:int                                                    ->
  ?height:int                                                   ->
  ?arrow_dir:(pop_over_array_direction [@js.default Arrow_any]) ->
  unit                                                          ->
  camera_pop_over_options
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Interface to the options javascript object *)
type options = private Ojs.t

(* Interface of a function allowing to create an options javascript object.
 * No constructor are given in the camera plugin.
 * js.stop tells to not translate it in js.
 *)

val create_options :
  ?quality:(int [@js.default 50])                                       ->
  ?destination_type:(destination_type [@js.default File_uri])           ->
  ?source_type:(picture_source_type [@js.default Camera])               ->
  ?allow_edit:(bool [@js.default true])                                 ->
  ?encoding_type:(encoding_type [@js.default Jpeg])                     ->
  ?target_width:(int [@js.default -1])                                  ->
  ?target_height:(int [@js.default -1])                                 ->
  ?media_type:(media_type [@js.default Picture])                        ->
  ?correct_orientation:(bool [@js.default true])                        ->
  ?save_to_photo_album:(bool [@js.default true])                        ->
  ?pop_over_options:(camera_pop_over_options option [@js.default None]) ->
  ?camera_direction:(direction [@js.default Back])                      ->
  unit                                                                  ->
  options
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Binding to the camera *)
    (* get_picture [success_cb] [error_cb] [options] *)
val get_picture  :  (string -> unit)                                ->
                    (string -> unit)                                ->
                    ?opt:(options [@js.default create_options ()])  ->
                    unit ->
                    unit
[@@js.global "navigator.camera.getPicture"]

(* cleanup [success_cb] [error_cb] *)
val clean_up :
  ?succ_cb:((unit -> unit) [@js.default (fun () -> ())])  ->
  ?err_cb:((unit -> unit) [@js.default (fun () -> ())])  ->
  unit ->
  unit
[@@js.global "navigator.camera.cleanUp"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Get the navigator.camera object *)
(* -------------------------------------------------------------------------- *)
