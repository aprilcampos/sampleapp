// import "jquery"
// import "@hotwired/turbo-rails"
// import "controllers"
// import consumer from "./channels/consumer"
// window.consumer = consumer
// import "bootstrap"
// import "@popperjs/core"

import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"
import "./controllers"

const application = Application.start()

// Manually import your controllers
import CommentFormController from "./controllers/comment_form_controller"
import FlashController from "./controllers/flash_controller"
import HamburgerController from "./controllers/hamburger_controller"
import HelloController from "./controllers/hello_controller"
import SortableController from "./controllers/sortable_controller"

// Register controllers
application.register("comment-form", CommentFormController)
application.register("flash", FlashController)
application.register("hamburger", HamburgerController)
application.register("hello", HelloController)
application.register("sortable", SortableController)