import { application } from "./application"

import SortableController from "./sortable_controller"
application.register("sortable", SortableController)

import FlashController from "./flash_controller"
application.register("flash", FlashController)