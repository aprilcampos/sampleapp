import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hamburger"
export default class extends Controller {
  static targets = ["hamburgerIcon", "closeIcon"]

  toggleIcons() {
    this.hamburgerIconTarget.classList.toggle("d-none")
    this.closeIconTarget.classList.toggle("d-none")
  }
}
