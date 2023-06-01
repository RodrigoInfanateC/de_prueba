document.addEventListener('DOMContentLoaded', function() {
    var searchForm = document.getElementById('search-form');
    var searchInput = searchForm.querySelector('input[type="search"]');
    var currentController = '<%= controller.controller_name %>';

    searchForm.addEventListener('submit', function(event) {
      event.preventDefault();
      var searchTerm = searchInput.value.trim();

      if (searchTerm !== '') {
        var searchPath = '';

        switch (currentController) {
          case 'administrators':
            searchPath = '<%= administrators_path %>';
            break;
          case 'supervisors':
            searchPath = '<%= supervisors_path %>';
            break;
          // Agrega otros casos según tus necesidades

          default:
            searchPath = '#';
        }

        if (searchPath !== '#') {
          window.location.href = searchPath + '?email=' + encodeURIComponent(searchTerm);
        }
      }
    });
  });
