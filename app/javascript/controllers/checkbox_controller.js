import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox"
export default class extends Controller {
  connect() {
  }

  changeValue(event) {
    fetch('/checklist', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        name: event.target.id,
        checked: event.target.value
      })
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
    })
  }
}
