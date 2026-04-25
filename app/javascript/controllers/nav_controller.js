import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["drawer"]

  toggle() {
    const open = this.drawerTarget.style.display === "flex"
    this.drawerTarget.style.display = open ? "none" : "flex"
  }

  close() {
    this.drawerTarget.style.display = "none"
  }
}
