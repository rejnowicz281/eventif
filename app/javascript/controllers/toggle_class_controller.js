import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle-class"
export default class extends Controller {
    static classes = ["change"];
    static targets = ["toggable"];

    toggle() {
        this.toggableTarget.classList.toggle(this.changeClass);
    }
}
