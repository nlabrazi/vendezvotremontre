const previewImage = () => {

  console.log("Preview Image");

  var selectElem = document.getElementsByClassName('select-watch-model');
  addEventListener('change', test);

  function test() {
    console.log(selectElem);
  }

}

export { previewImage };
