import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-evite"
export default class extends Controller {
  static targets = ['evite']
  connect() {

    this.eviteTargets[0].classList.remove('d-none')
    this.eviteTargets[1].classList.add('d-none')
    this.eviteTargets[2].classList.add('d-none')
  }

  displayEvite(event) {
    switch(event.target.id) {
      case 'e_vite_1':

          this.eviteTargets[0].classList.remove('d-none')
          this.eviteTargets[1].classList.add('d-none')
          this.eviteTargets[2].classList.add('d-none')
        break;
      case 'e_vite_2':

          this.eviteTargets[0].classList.add('d-none')
          this.eviteTargets[1].classList.remove('d-none')
          this.eviteTargets[2].classList.add('d-none')
        break;
      case 'e_vite_3':

          this.eviteTargets[0].classList.add('d-none')
          this.eviteTargets[1].classList.add('d-none')
          this.eviteTargets[2].classList.remove('d-none')
        break;
      default:
        // code block
    }
  }
}
