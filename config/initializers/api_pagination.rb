ApiPagination.configure do |config|
  config.paginator = :kaminari

  config.total_header = 'X-Total'

  config.per_page_header = 'X-Per-Page'

  # Optional: set this to add a header with the current page number.
  # config.page_header = 'X-Page'

  config.page_param = :page

  # config.per_page_param = :per_page
end