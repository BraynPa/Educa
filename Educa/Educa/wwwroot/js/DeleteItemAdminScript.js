function Delete(value, item) {
    let link = `/admin/Delete${item}?value=${value}`;
    window.location = link;
}