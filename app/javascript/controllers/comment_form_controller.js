import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static targets = ["textarea"]
  static values = {
    blogId: Number
  }

  connect() {
    console.log("Connecting to BlogsChannel for blog ID:", this.blogIdValue)
    this.channel = consumer.subscriptions.create(
      { channel: "BlogsChannel", blog_id: this.blogIdValue },
      {
        received: data => {
          console.log("Received data:", data)
          const commentsContainer = document.getElementById("comments")
          commentsContainer.insertAdjacentHTML("beforeend", data.comment_partial)
        }
      }
    )
  }

  send(event) {
    event.preventDefault()
    const content = this.textareaTarget.value.trim()
    if (content === "") return

    console.log("Sending comment:", content)
    this.channel.perform("send_comment", {
      comment: content,
      blog_id: this.blogIdValue
    })

    this.textareaTarget.value = ""
  }
}
