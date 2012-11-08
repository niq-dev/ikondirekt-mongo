$(function () {
    $("#region_code").remoteChained("#state_code", "/api/locations");

    $("#region_code").bind("change", function () {
        $("#region_code").trigger("liszt:updated");
    });

    $("#place_code").remoteChained("#region_code", "/api/locations");

    $("#place_code").bind("change", function () {
        $("#place_code").trigger("liszt:updated");
    });
});