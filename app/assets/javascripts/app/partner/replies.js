$(function() {
    $("#region").chained("#state"); /* or $("#series").chainedTo("#mark"); */
    $("#region").trigger("liszt:updated");

    $("#state").bind("change", function() {
        $("#region").trigger("liszt:updated");
    });

    $("#place").chained("#region"); /* or $("#series").chainedTo("#mark"); */
});