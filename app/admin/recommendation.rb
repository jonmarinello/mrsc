ActiveAdmin.register Recommendation do
  permit_params :id, :name, :title, :body, :image_url

  config.sort_order = 'position_asc' # assumes you are using 'position' for your acts_as_list column
  config.paginate   = false # optional; drag-and-drop across pages is not supported

  sortable # creates the controller action which handles the sorting

  index do
    sortable_handle_column # inserts a drag handle
    selectable_column
    id_column
    column :name
    column :title
    column :body
    column :image_url
    actions
  end

end
