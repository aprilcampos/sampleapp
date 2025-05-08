import { application } from "./application"

import HamburgerController from "./hamburger_controller"
application.register("hamburger", HamburgerController)

import SortableController from "./sortable_controller"
application.register("sortable", SortableController)

import FlashController from "./flash_controller"
application.register("flash", FlashController)

import CommentFormController from "./comment_form_controller"
application.register("comment-form", CommentFormController)