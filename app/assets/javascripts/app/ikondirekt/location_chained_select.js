$(function () {
    $("#region_code").remoteChained("#state_code", "/api/locations");

    $("#place_code").remoteChained("#region_code", "/api/locations");
});