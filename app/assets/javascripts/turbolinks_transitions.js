document.addEventListener('page:change', function() {
        document.getElementById('primary-content').className += 'animated rollIn';
});
document.addEventListener('page:fetch', function() {
        document.getElementById('primary-content').className += 'animated rollIn';
});