import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-guest"
export default class extends Controller {
  static targets = ['infos', 'form']

  connect() {
    // console.log(this.infosTarget);
    // console.log(this.element);
    // console.log("hi");

  }

  displayForm() {
    console.log(this.formTargets)
    this.infosTarget.classList.add('d-none')
    this.formTarget.classList.remove('d-none')
  }

  update(event) {
    event.preventDefault()

    const url = this.formTarget.action
    console.log();

    fetch(url, {
      method: 'PATCH',
      headers: { 'Accept': 'text/plain' },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        // console.log(data);
        this.element.outerHTML = data
      })
  }
}
