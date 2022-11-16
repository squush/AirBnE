import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  toggle() {
    this.element.classList.toggle("clicked");

    const areas_clicked = Array.from(document.getElementsByClassName("clicked"));
    const crime_cards = Array.from(document.getElementsByClassName("crime-card"));
    let areas_to_show = [];
    areas_clicked.forEach(type => areas_to_show.push(type.innerText));

    if (areas_to_show.length === 0) {
      crime_cards.forEach(card => { card.style.display = "block" });
    } else {
      crime_cards.forEach(card => {
        card.style.display = "block";
        if (!areas_to_show.includes(card.getElementsByTagName("h5")[0].innerText)) {
        card.style.display = "none";
      } });
    }
  }
}
