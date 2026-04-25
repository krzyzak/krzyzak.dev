import { Controller } from "@hotwired/stimulus"

const CAREER_START_YEAR = 2011

export default class extends Controller {
  connect() {
    const years = new Date().getFullYear() - CAREER_START_YEAR
    this.element.textContent = `${years}+ yrs`
  }
}
