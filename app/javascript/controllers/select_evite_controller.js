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

  saveEvite(event) {
    //console.log(this.eviteTargets)
    let select_evite = ''
    this.eviteTargets.forEach((element, index) => {
      if (element.classList.value == '') {
        select_evite = element.id }
      //element.hidden = index !== this.index
    })
    //console.log(select_evite)
    this.save(select_evite)
  }

  save(select_evite) {

    const url = this.eviteTarget.action
    console.log(this.eviteTargets);

    // fetch(url, {
    //   method: 'POST',
    //   headers: { 'Accept': 'text/plain' },
    //   body: new FormData(select_evite)
    // })
    //   .then(response => response.text())
    //   .then((data) => {
    //     // console.log(data);
    //     this.element.outerHTML = data
    //   })
  }
}
