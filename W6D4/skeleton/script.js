document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  //Unfinished

  const listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", event => {
    // **cancel** the event; if the event were not canceled the browser
    // would try to submit the form for real.
    event.preventDefault();

    const placeInput = document.getElementsByClassName("favorite-input");
    // debugger
    const placeName = placeInput.value;
    placeInput.value = "";

    const ul = document.getElementById("sf-places");

    const li = document.createElement("li");
    li.textContent = placeName;

    ul.append(li);
  });



  // adding new photos

  // --- your code here!

  // adding new photos

const showPhotoForm = (e) => {
  const photoFormDiv = document.querySelector(".photo-form-container");
  if (photoFormDiv.className === "photo-form-container") {
    photoFormDiv.className = "photo-form-container hidden";
  } else {
    photoFormDiv.className = "photo-form-container";
  }
};

const photoFormShowButton = document.querySelector(".photo-show-button");
photoFormShowButton.addEventListener("click", showPhotoForm);


const handlePhotoSubmit = (e) => {
  e.preventDefault();

  const photoUrlInput = document.querySelector(".photo-url-input");
  const photoUrl = photoUrlInput.value;
  photoUrlInput.value = "";

  const newImg = document.createElement("img");
  newImg.src = photoUrl;

  const newPhotoLi = document.createElement("li");
  newPhotoLi.appendChild(newImg);

  const dogPhotosList = document.querySelector(".dog-photos");
  dogPhotosList.appendChild(newPhotoLi);
};

const photoSubmitButton = document.querySelector(".photo-url-submit");
photoSubmitButton.addEventListener("click", handlePhotoSubmit);



});
