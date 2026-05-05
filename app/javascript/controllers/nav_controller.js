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

  emailMe() {
    window.location.href = "mailto:michal.krzyzanowski@gmail.com"
  }

  openGitHub() {
    window.open("https://github.com/krzyzak", "_blank", "noopener,noreferrer")
  }

  openLinkedIn() {
    window.open("https://linkedin.com/in/krzyzak", "_blank", "noopener,noreferrer")
  }
}
