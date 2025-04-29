import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        setTimeout(() => {
            this.element.classList.add("opacity-0");
            setTimeout(() => {
                this.element.remove();
            }, 1000); // Match the fade-out duration
        }, 3000); // Show for 3 seconds first
    }
}
