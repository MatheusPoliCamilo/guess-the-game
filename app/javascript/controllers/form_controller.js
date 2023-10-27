import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = [ "input" ]

  clearInput() {
    this.inputTarget.value = ""
  }
}
