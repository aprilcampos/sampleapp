import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  connect() {
    this.sortable = new Sortable(this.element, {
      animation: 150,
      onEnd: (event) => {
        this.update(event)
      }
    })
  }

  update(event) {
    let id = event.item.dataset.id
    let position = event.newIndex

    this.send(id, position)
  }

  send(id, position) {
    fetch(`/portfolios/${id}/sort`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "text/vnd.turbo-stream.html"
      },
      body: JSON.stringify({ position: position })
    })
  }
}
