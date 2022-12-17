import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-products"
export default class extends Controller {
  static targets = ["form", "input", "filter", "list"]

  connect() {
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.filterTarget)
    console.log(this.listTarget)
  }

  update() {
    console.log("send request in AJAX")
    // console.log(this.filterTarget.value)
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}&filter=${this.filterTarget.value}`
    console.log(url)
    // const url = `${this.formTarget.action}?filter=${this.filterTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
    })
  }

}
