import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item"]

  toggle(event) {
    const item = event.currentTarget.closest("[data-accordion-target='item']")
    const isOpen = item.classList.contains("open")

    this.itemTargets.forEach(i => this.#close(i))
    if (!isOpen) this.#open(item)
  }

  #open(item) {
    const body  = item.querySelector(".acc-body")
    const arrow = item.querySelector(".acc-arrow")
    const btn   = item.querySelector(".acc-trigger")

    item.classList.add("open")
    body.classList.add("open")
    body.style.paddingBottom = "16px"
    arrow.style.transform = "rotate(0deg)"
    arrow.style.color = "#4ade80"
    btn.style.background = "rgba(74,222,128,0.04)"
  }

  #close(item) {
    const body  = item.querySelector(".acc-body")
    const arrow = item.querySelector(".acc-arrow")
    const btn   = item.querySelector(".acc-trigger")

    item.classList.remove("open")
    body.classList.remove("open")
    body.style.paddingBottom = "0"
    arrow.style.transform = "rotate(-90deg)"
    arrow.style.color = "#334155"
    btn.style.background = "transparent"
  }
}
