import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  toggle() {
    // Toggles class each click
    this.element.classList.toggle("clicked");

    // Get all crime cards and all area filters selected
    const areas_clicked = Array.from(document.getElementsByClassName("clicked"));
    const crime_cards = Array.from(document.getElementsByClassName("crime-card"));
    let areas_to_show = [];
    areas_clicked.forEach(type => areas_to_show.push(type.innerText));

    // Default to displaying all crimes, hide all crimes that were not selected
    if (areas_to_show.length === 0) {
      crime_cards.forEach(card => { card.style.display = "block" });
    } else {
      crime_cards.forEach(card => {
        card.style.display = "block";
        if (!areas_to_show.includes(card.getElementsByClassName("crime-area")[0].innerText)) {
          card.style.display = "none";
      } });
    }
  }
}
