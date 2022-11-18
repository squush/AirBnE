import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  toggle() {
    // Toggles class each click
    this.element.classList.toggle("clicked");

    // Get all crime cards and all crime type filters selected
    const types_clicked = Array.from(document.getElementsByClassName("clicked"));

    const crime_cards = Array.from(document.getElementsByClassName("crime-card"));
    // console.log(crime_cards);
    let types_to_show = [];
    types_clicked.forEach(type => types_to_show.push(type.innerText.toLowerCase()));
    // console.log(types_to_show);

    // Default to displaying all crimes, hide all crimes that were not selected
    if (types_to_show.length === 0) {
      // console.log("hello");
      crime_cards.forEach(card => { card.style.display = "block" });
    } else {
      crime_cards.forEach(card => {
        // console.log(card.getElementsByClassName("crime-type")[0].innerText.toLowerCase());
        // console.log(types_to_show);
        card.style.display = "block";
        if (!types_to_show.includes(card.getElementsByClassName("crime-type")[0].innerText.toLowerCase())) {
          // console.log("heeeyo");
          card.style.display = "none";
          // console.log(card);
      } });
    }
  }
}
