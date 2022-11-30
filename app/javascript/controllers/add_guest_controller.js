import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-guest"
export default class extends Controller {
  static targets = ['form']

  connect() {
    // console.log(this.formTarget);
  }

  displayForm() {
    // console.log(this.formTargets)
    // this.infosTarget.classList.add('d-none')
    this.formTarget.classList.remove('d-none')
  }
}
