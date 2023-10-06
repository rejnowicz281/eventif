import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="event-sidebars"
export default class extends Controller {
    static classes = ["left", "right"];
    static targets = ["left", "right"];

    toggleLeft() {
        this.leftTarget.classList.toggle(this.leftClass);
    }

    toggleRight() {
        this.rightTarget.classList.toggle(this.rightClass);
    }
}
