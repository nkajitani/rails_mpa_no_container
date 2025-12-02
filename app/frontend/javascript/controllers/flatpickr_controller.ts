import flatpickr from "flatpickr";
import "flatpickr/dist/themes/material_blue.css";
import { Controller } from "@hotwired/stimulus";

type FlatpickrInstance = flatpickr.Instance;

export default class extends Controller<HTMLInputElement> {
  static values = {
    enableTime: { type: Boolean, default: false },
  };

  declare readonly enableTimeValue: boolean;
  private pickr: FlatpickrInstance | null = null;

  connect() {
    this.pickr = flatpickr(this.element, {
      enableTime: this.enableTimeValue,
      dateFormat: this.enableTimeValue ? "Y-m-d H:i" : "Y-m-d",
    });
  }
  disconnect() {
    if (this.pickr) {
      this.pickr.destroy();
      this.pickr = null;
    }
  }
}
