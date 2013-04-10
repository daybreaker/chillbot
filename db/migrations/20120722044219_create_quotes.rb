Sequel.migration do
  change do
    create_table :quotes do
      primary_key :id
      string :quote
      string :author
    end
  end
end

