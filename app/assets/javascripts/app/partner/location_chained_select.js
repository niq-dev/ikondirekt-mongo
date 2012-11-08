$(function () {
    $("#region_code").remoteChained("#state_code", "/api/locations");

    $("#region_code").bind("change", function () {
        $("#region_code").trigger("liszt:updated");
    });

    $("#place_codes").remoteChained("#region_code", "/api/locations");

    $("#place_codes").bind("change", function () {
        $("#place_codes").trigger("liszt:updated");
    });
});