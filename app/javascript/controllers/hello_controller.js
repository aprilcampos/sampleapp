import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("✅ HelloController is connected!")
    this.element.innerHTML += "<p style='color: green;'>HelloController is working!</p>"
  }
}
