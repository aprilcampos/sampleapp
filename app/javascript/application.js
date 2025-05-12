// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "jquery"

import "@hotwired/turbo-rails"
import "controllers"

import consumer from "./channels/consumer"
window.consumer = consumer

import "bootstrap"
import "cocoon"