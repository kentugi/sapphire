// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"
import $ from "jquery"
import "select2"


// // In your Javascript (external .js resource or <script> tag)
// $(document).ready(function() {
//   $('#boat_type').select2({ selectionCssClass: "search-input drop-shadow no-mb select2" });
// });
