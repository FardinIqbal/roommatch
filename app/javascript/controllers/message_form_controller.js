import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    clear(event) {
        if (event.detail.success) {
            this.element.reset()
        }
    }
}
