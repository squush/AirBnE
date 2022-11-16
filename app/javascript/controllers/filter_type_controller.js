import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  toggle() {
    this.element.classList.toggle("clicked");
    // Jackson - started to implement filtering logic, TODO
    const types_clicked = Array.from(document.getElementsByClassName("clicked"));
    const crime_cards = Array.from(document.getElementsByClassName("crime-card"));
    let types_to_show = [];
    types_clicked.forEach(type => types_to_show.push(type.innerText));

    if (types_to_show.length === 0) {
      crime_cards.forEach(card => { card.style.display = "block" });
    } else {
      crime_cards.forEach(card => {
        card.style.display = "block";
        if (!types_to_show.includes(card.getElementsByTagName("h3")[0].innerText)) {
        card.style.display = "none";
      } });
    }



  }
}
