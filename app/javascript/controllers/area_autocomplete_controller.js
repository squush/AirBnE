import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="area-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["area"]

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })
    this.geocoder.addTo(this.element)
  }

  disconnect() {
    this.geocoder.onRemove()
  }
}