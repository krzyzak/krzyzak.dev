import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tip"]

  show() {
    const rect = this.element.getBoundingClientRect()
    const tip = this.tipTarget

    tip.style.position = "fixed"
    tip.style.bottom = `${window.innerHeight - rect.top + 10}px`
    tip.style.left = `${rect.left + rect.width / 2}px`
    tip.style.transform = "translateX(-50%)"
    tip.classList.remove("hidden")
  }

  hide() {
    const tip = this.tipTarget
    tip.classList.add("hidden")
    tip.style.cssText = ""
  }
}
