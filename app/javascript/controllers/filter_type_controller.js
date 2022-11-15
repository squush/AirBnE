import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  toggle() {
    this.element.classList.toggle("clicked");
    // Jackson - started to implement filtering logic, TODO
    //
    // const types_clicked = document.getElementsByClassName("clicked");
    // const crime_cards = document.getElementsByClassName("crime-card");
    // console.log(types_clicked);
    // console.log(crime_cards);
  }
}
