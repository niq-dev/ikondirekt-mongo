$(function() {
    $("#region").remoteChained("#state", "/api/locations"); /* or $("#series").chainedTo("#mark"); */
    $("#place").remoteChained("#region"); /* or $("#series").chainedTo("#mark"); */
});