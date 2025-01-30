import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  initialize() {
    console.log("initialize");
  }
  connect() {
    console.log("Hello from comments_controller.js");
  }
  toggleForm(event) {
    console.log("Hello from comments_controller.js");
    event.preventDefault();
    event.spotPropagation();
    const formID = event.params["form"];
    const commentBodyID = event.params["body"];
    const form = documment.getElementById(formID);
    form.classList.toggle("d-none");
    form.classList.toggle("mt-5");
    const commentBody = document.getElementById(commentBodyID);
    commentBody.classList.toggle("d-none");
  }
}
