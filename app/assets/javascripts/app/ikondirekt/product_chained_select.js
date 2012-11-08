$(function () {
    $("#sub_category").remoteChained("#root_category", "/api/products");
    $("#product").remoteChained("#sub_category", "/api/products");
});