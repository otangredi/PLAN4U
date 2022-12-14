import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-table"
export default class extends Controller {
  static targets = ['table']
  connect() {
    // console.log(this.tableTargets)
  }

  displayTable(event) {
    event.preventDefault()
    // console.log(this.tableTargets[event.target.id - 1])
    console.log(this.tableTargets)
    this.tableTargets.forEach(element => {
      element.classList.add("d-none")
    });
    this.tableTargets[event.target.id - 1].classList.toggle("d-none")
  }
}
