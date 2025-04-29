import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.timeout = setTimeout(() => {
            this.dismiss();
        }, 3000); // Auto-dismiss after 3 seconds
    }

    dismiss() {
        this.element.classList.add("opacity-0");
        setTimeout(() => {
            this.element.remove();
        }, 1000); // Match Tailwind fade duration
    }
}
