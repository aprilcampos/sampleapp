// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "https://code.jquery.com/jquery-3.7.1.min.js"

import "@hotwired/turbo-rails"
import "controllers"

import consumer from "./channels/consumer"
window.consumer = consumer

import "bootstrap"
import "cocoon"