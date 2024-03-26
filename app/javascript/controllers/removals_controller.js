import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  remove() {
    debugger
    this.element.remove()
  }
}