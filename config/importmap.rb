# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "controllers/comment_form_controller", to: "controllers/comment_form_controller.js"
pin "controllers/sortable_controller", to: "controllers/sortable_controller.js"
pin "controllers/flash_controller", to: "controllers/flash_controller.js"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"
pin "sortablejs", to: "https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/modular/sortable.esm.js", preload: true
pin "jquery", to: "https://code.jquery.com/jquery-3.7.1.min.js"
pin "cocoon", to: "cocoon.js"
pin "consumer", to: "channels/consumer.js"
pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"