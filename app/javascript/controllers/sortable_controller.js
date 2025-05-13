import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  connect() {
    this.setupSortable()

    this.resizeHandler = this.handleResize.bind(this)
    window.addEventListener("resize", this.resizeHandler)
  }

  disconnect() {
    this.destroySortable()
    window.removeEventListener("resize", this.resizeHandler)
  }

  setupSortable() {
    if (window.innerWidth >= 768 && !this.sortable) {
      this.sortable = new Sortable(this.element, {
        animation: 150,
        onEnd: (event) => this.update(event)
      })
    } else if (window.innerWidth < 768 && this.sortable) {
      this.destroySortable()
    }
  }

  handleResize() {
    this.setupSortable()
  }

  destroySortable() {
    if (this.sortable) {
      this.sortable.destroy()
      this.sortable = null
    }
  }

  update(event) {
    const id = event.item.dataset.id
    const position = event.newIndex
    this.send(id, position)
  }

  send(id, position) {
    fetch(`/portfolios/${id}/sort`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "text/vnd.turbo-stream.html"
      },
      body: JSON.stringify({ position })
    })
  }
}
