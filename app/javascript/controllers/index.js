// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import EditGuestController from "./edit_guest_controller"
application.register("edit-guest", EditGuestController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import SelectEviteController from "./select_evite_controller"
application.register("select-evite", SelectEviteController)

import TurboController from "./turbo_controller"
application.register("turbo", TurboController)
