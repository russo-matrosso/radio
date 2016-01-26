Sequel.migration do
  change do
    create_table(:songs) do
      primary_key :id
      String :title, null: false
      String :artist, null: false
    end
  end
end