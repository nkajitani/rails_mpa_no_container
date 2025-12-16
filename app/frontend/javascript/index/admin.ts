import application from "@/javascript/application";
import flatpickr_controller from "@/javascript/controllers/flatpickr_controller";
import type { TurboFrameMissingEvent } from "@hotwired/turbo";

application.register("flatpickr", flatpickr_controller);

document.addEventListener("turbo:frame-missing",
  async (event: TurboFrameMissingEvent) => {
    const {
      detail: { response, visit },
    } = event;

    event.preventDefault();
    await visit(response, { action: "replace" });
  }
);
