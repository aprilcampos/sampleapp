import { Controller } from "@hotwired/stimulus"
import { Alert } from "bootstrap"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.querySelectorAll(".alert").forEach((el) => {
        const alert = Alert.getOrCreateInstance(el)
        alert.close()
      })
    }, 3000)
  }
}