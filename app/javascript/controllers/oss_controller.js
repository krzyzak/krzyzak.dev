import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["a", "s", "d", "f", "h", "j"]

  shortcut(event) {
    const card = this.targets.find(event.key.toLowerCase())
    if (card) window.open(card.getAttribute("href"), "_blank", "noopener,noreferrer")
  }
}
