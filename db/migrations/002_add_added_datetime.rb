Sequel.migration do
  change do
    add_column :songs, :added, Integer
  end
end