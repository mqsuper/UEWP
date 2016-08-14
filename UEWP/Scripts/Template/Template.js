function openTemplateContainer(evt, containerName) {
   
    var i, x, tablinks;
    x = $(".templateContainer");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    tablinks = $(".tablink");
    for (i = 0; i < x.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
    }
    $("#" + containerName).removeClass("hidden");
    $("#" + containerName).css("display", "block");
    evt.currentTarget.className += " w3-red";
}